const mysql = require("mysql2");

// Create a connection pool using ENV variables (Docker-safe)
const pool = mysql.createPool({
  host: process.env.DB_HOST || "fitness-mysql",
  user: process.env.DB_USER || "teddy",
  password: process.env.DB_PASSWORD || "teddy4309",
  database: process.env.DB_NAME || "fittrack",
  port: process.env.DB_PORT || 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = pool.promise();
