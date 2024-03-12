const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host: 'noneq.cnygwcwe08j9.us-east-1.rds.amazonaws.com',
  user: 'admin',
  password: 'password',
  database: 'noneq',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = pool;