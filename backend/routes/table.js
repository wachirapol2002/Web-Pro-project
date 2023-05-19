const express = require("express");
const pool = require("../config");
const Joi = require('joi')

router = express.Router();

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

//book
router.post('/table/book', async (req, res, next) => {
    const bookSchema = Joi.object({
        username: Joi.string().required(),
        table: Joi.string().required(),
        date: Joi.date().min('now').iso().required(),
        time: Joi.string().regex(/^\d{2}:\d{2}$/)
    })
    try {
        await bookSchema.validateAsync(req.body, { abortEarly: false })
    } catch (err) {
        return res.status(400).send(err)
    }
    const username = req.body.username
    const table = req.body.table
    const date = req.body.date
    const time = req.body.time
    console.log(req.body)
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    try {
        await conn.query(
            'INSERT INTO booking(username, table_num, booking_date, booking_time) VALUES (?, ?, ?, ?)',
            [username, table, date, time]
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


exports.router = router