var mysql = require('mysql');
var con = mysql.createConnection({
    host: "418mysqlserver.mysql.database.azure.com",
    user: "myadmin@418mysqlserver",
    password: "418IsHard",
    database: "418database"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  var sql = "INSERT INTO `test3`(`name`,`email`, `description`) VALUES ('myface','something@email.com','lolloooll')";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Row inserted");
  });
});