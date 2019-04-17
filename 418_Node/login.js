var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var con = mysql.createConnection({
    host: "418mysqlserver.mysql.database.azure.com",
    user: "myadmin@418mysqlserver",
    password: "418IsHard",
    database: "418database"
});

router.post('/submitform/', function(req, res, next) {
    console.log(req.body.user);
    console.log(req.body.pass);
    
    con.connect(function(err) {
  if (err) throw  err;
  console.log("connected");
  var sql = "INSERT INTO `login`(`user`,`pass`) VALUES ('"+req.body.user+"','"+req.body.pass+"')";
  con.query(sql, function(err, result)  {
   if(err) throw err;
   console.log("table created");
  });
});

  res.render('index', { title: 'Express' });
});


module.exports = router;