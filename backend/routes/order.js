const express = require("express");
const pool = require("../config");

router = express.Router();

//AddtoOrder
router.post('/order', async (req, res, next) => {

    const conn = await pool.getConnection()
    await conn.beginTransaction()

    const orders = req.body.order
    const sum_price = req.body.sum_price
    const table = req.body.table

    try {
        const insert_order = await conn.query(
            'INSERT INTO orders(order_price, table_num) VALUES (0, ?)',
            [table]
        )
        
        const order_id = insert_order[0].insertId

        orders.forEach (async(order) => {
            await conn.query(
            'INSERT INTO order_details(order_id, menu_id, quantity, quantity_price) VALUES (?, ?, ?, ?)',
            [order_id, order.menu_id, order.menu_quantity, order.menu_price*order.menu_quantity]
        )
        })

        await conn.query(
            'UPDATE orders SET order_price=? WHERE order_id=?;',
            [sum_price, order_id]
        )

        const sum_prices = await conn.query(
            'SELECT sum(order_price) sum_pricess FROM orders WHERE table_num = ?;',
            [table]
        )
        await conn.query(
            'UPDATE tables SET total_price = ? WHERE table_num = ?;',
            [sum_prices[0][0].sum_pricess ,table]
        )

        conn.commit()
        res.status(201).json({
            all_sum: sum_prices[0][0].sum_pricess
        })
    } catch (err) {
        conn.rollback()
        res.status(400).json(err.toString());
    } finally {
        conn.release()
    }
})

exports.router = router