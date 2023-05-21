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

exports.router = router;
