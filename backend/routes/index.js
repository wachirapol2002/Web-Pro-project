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
    let sql = 'SELECT * FROM booking'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM booking WHERE username = ? OR table_num =?;'
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
    let sql = 'SELECT * FROM checkin'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM checkin WHERE username = ? OR table_num =?;'
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
    let sql = 'SELECT * FROM payments'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM payments WHERE username = ? OR table_num =?;'
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
    let sql = 'SELECT * FROM vip'
    let cond = []

    if (search.length > 0) {
      sql = 'SELECT * FROM vip WHERE username = ?;'
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

exports.router = router;
