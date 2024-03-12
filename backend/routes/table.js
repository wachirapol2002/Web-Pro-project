const express = require("express");
const pool = require("../config");
const Joi = require('joi')

router = express.Router();

function formatTime(date) {
    const hours = date.getHours().toString().padStart(2, "0");
    const minutes = date.getMinutes().toString().padStart(2, "0");
    return `${hours}:${minutes}`;
  }

router.post('/table/bookData', async (req, res, next) => {
    const table = req.body.table
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    try {
        const [Booking] = await conn.query(
            "SELECT * FROM booking WHERE table_num = ? AND create_booking = (SELECT max(create_booking) FROM booking WHERE table_num = ?);",
            [table, table]
        )
        conn.commit()
        if(Booking.length > 0){
            res.status(200).json(Booking[0]);
        }
        else{
            res.status(200).json({
                username: "table"+table,
                booking_time: formatTime(new Date())
            });
        }
    } catch (error) {
        conn.rollback()
        res.status(400).json(error.toString())
    } finally {
        conn.release()
    }
})

router.post('/table/haveTable', async (req, res, next) => {
    const username = req.body.username
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    try {
        const [already] = await conn.query(
            "SELECT * FROM tables WHERE username = ?",
            [username]
        )
        conn.commit()
        res.status(200).json({ 'result': already.length > 0 });
    } catch (error) {
        conn.rollback()
        res.status(400).json(error.toString())
    } finally {
        conn.release()
    }
})

const alreadyTable = async (req, res, next) => {
    if (req.body.account.permission === 'staff') {
        return next()
    }
    const [already] = await pool.query(
        "SELECT * FROM tables WHERE username = ?",
        [req.body.account.username]
    )
    if (already.length > 0) {
      return res.status(400).send('You do not have permission to perform this action')
    }
    next()
  }

//book
router.post('/table/book', alreadyTable, async (req, res, next) => {
    const now = (value) => {
        const currentTime = new Date();
        const [hours, minutes] = value.split(':');
        const selectedTime = new Date();
        selectedTime.setHours(hours);
        selectedTime.setMinutes(minutes);
        if (selectedTime < currentTime) {
            throw new Joi.ValidationError('in the past' +new Date())
        }
        return value;
    }
    const bookSchema = Joi.object({
        account: Joi.object().required(),
        table: Joi.string().required(),
        time: Joi.string().regex(/^\d{2}:\d{2}$/).custom(now),
    })
    try {
        await bookSchema.validateAsync(req.body, { abortEarly: false })
    } catch (err) {
        return res.status(400).send(err)
    }
    const username = req.body.account.username
    const table = req.body.table
    const time = req.body.time
    console.log(req.body)
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    try {
        await conn.query(
            'INSERT INTO booking(username, table_num, booking_time) VALUES (?, ?, ?)',
            [username, table, time]
        )
        await conn.query(
            'UPDATE tables SET username=?, table_status="booked" WHERE table_num=?',
            [username, table]
        )
        conn.commit()
        res.status(201).send()
    } catch (err) {
        conn.rollback()
        res.status(400).send(err);
    } finally {
        conn.release()
    }
})

router.post('/table/cancel', async (req, res, next) => {
    const table = req.body.table
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    try {
        await conn.query(
            "UPDATE tables SET table_status = 'available', username = NULL WHERE table_num = ?;",
            [table]
        )
        conn.commit()
        res.status(200).send();
    } catch (error) {
        conn.rollback()
        res.status(400).json(error.toString())
    } finally {
        conn.release()
    }
})

router.post('/table/checkin', async (req, res, next) => {
    const booking_id = req.body.booking_id
    const username = req.body.username
    const table = req.body.table
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    try {
        await conn.query(
            "INSERT INTO checkIN(booking_id, username, table_num) VALUES (?, ?, ?)",
            [booking_id, username, table]
        )
        await conn.query(
            "UPDATE tables SET table_status = 'unavailable', username = ? WHERE table_num = ?;",
            [username, table]
        )
        conn.commit()
        res.status(200).send();
    } catch (error) {
        conn.rollback()
        res.status(400).json(error.toString())
    } finally {
        conn.release()
    }
})

router.post('/table/checkout', async (req, res, next) => {
    const username = req.body.username
    const table = req.body.table
    let total_price = req.body.total_price
    console.log(req.body)
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    try {
        const [accounts] = await conn.query(
            'SELECT * FROM accounts WHERE username=?', 
            [username]
        )
        const account = accounts[0]
        if(account.permission == "VIP"){
            total_price = Math.floor((total_price*90)/100)
        }
        
        //บันทึกเวลาออก
        await conn.query(
            "UPDATE checkin SET checkOut_time = current_timestamp() "+
            "WHERE username = ? AND table_num =? AND checkOut_time IS NULL;",
            [username, table]
        )
        //ออกบิล
        await conn.query(
            "INSERT INTO payments(username, table_num, total_price) VALUES (?, ?, ?)",
            [username, table, total_price]
        )
        //clear order
        await conn.query(
            "DELETE FROM orders WHERE table_num = ?;",
            [table]
        )
        //เปลี่ยนสถานะโต๊ะ
        await conn.query(
            "UPDATE tables SET total_price = 0, table_status = 'available', username = null WHERE table_num = ?;",
            [table]
        )
        conn.commit()
        res.status(200).send();
    } catch (error) {
        conn.rollback()
        res.status(400).json(error.toString())
    } finally {
        conn.release()
    }
})

exports.router = router