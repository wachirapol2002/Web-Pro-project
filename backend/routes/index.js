const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM tables'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM tables WHERE table_num = ? OR table_status =?;'
      cond = [search, search]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.get("/booking", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM booking ORDER BY create_booking DESC;'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM booking WHERE username = ? OR table_num =? ORDER BY create_booking DESC;'
      cond = [search, search]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.get("/checkin", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM checkin ORDER BY checkIN_time DESC;'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM checkin WHERE username = ? OR table_num =? ORDER BY checkIN_time DESC;'
      cond = [search, search]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.get("/payments", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM payments ORDER BY payment_time DESC;'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM payments WHERE username = ? OR table_num =? ORDER BY payment_time DESC;'
      cond = [search, search]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.get("/VIP", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM vip ORDER BY expire_date ASC;'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM vip WHERE username = ? ORDER BY expire_date ASC;'
      cond = [search]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.get("/VIP/:username", async function (req, res, next) {
  try {
    const username = req.params.username
    let sql = 'SELECT * FROM vip WHERE username = ? ORDER BY expire_date DESC;'
    let cond = [username]
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows[0]);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.get("/registerVIP", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM slip_image ORDER BY confirm ASC;'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM slip_image WHERE username = ? OR confirm = ? ORDER BY confirm ASC;'
      cond = [search]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.get("/menu", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM menus'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM menus WHERE menu_id = ?;'
      cond = [`%${search}%`]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});


router.get("/orderdetail", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM order_details'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM menus WHERE order_details_id = ?;'
      cond = [`%${search}%`]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});

router.post('/order', async (req, res, next) => {
  const table = req.body.table
  const conn = await pool.getConnection()
  await conn.beginTransaction()
  try {
      const [order_id] = await pool.query(
          "SELECT * FROM orders JOIN order_details USING (order_id) WHERE table_num = ?;",
          [table]
      )
      conn.commit()
      res.status(200).json({orders: order_id});
  } catch (error) {
      conn.rollback()
      res.status(400).json(error.toString())
  } finally {
      conn.release()
  }
})

router.get("/order", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM orders'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM menus WHERE order_id = ?;'
      cond = [`%${search}%`]
    }
    const [rows, fields] = await pool.query(sql, cond);
    return res.json(rows);
  } catch (err) {
    return res.status(500).json(err)
  }
});
exports.router = router;
