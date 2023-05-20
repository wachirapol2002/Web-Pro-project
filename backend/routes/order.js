const express = require("express");
const pool = require("../config");
const bcrypt = require('bcrypt')

router = express.Router();



//AddtoOrder
router.post('/order', async (req, res, next) => {

    const conn = await pool.getConnection()
    await conn.beginTransaction()
    const menu_name = req.body.menu_name
    const menu_price = req.body.menu_price

    try {
        await conn.query(
            'INSERT INTO order_details(order_detail_id, order_id, menu_id, quantity, quantitiy_price) VALUES (?, ?, ?, ?, ?)',
            [username, password, firstname, lastname, email]
        )
        conn.commit()
        res.status(201).send()
    } catch (err) {
        conn.rollback()
        res.status(400).json(err.toString());
    } finally {
        conn.release()
    }
})


exports.router = router