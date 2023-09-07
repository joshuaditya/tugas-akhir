const express = require('express');
const path = require('path');

const mysql = require('mysql2');

const mysqlConfig = {
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: "test_db"
}

const app = express();

app.use(express.static(path.join(__dirname, 'public')));

app.get('/connect', function (req, res) {
    con =  mysql.createConnection(mysqlConfig);
    con.connect(function(err) {
      if (err) throw err;
      res.send('connected')
    });
  })

app.listen(3000, () => {
    console.log("App listening on port 3000");
})
