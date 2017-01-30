var mysql = require('mysql');
var inquirer = require('inquirer');
var Table = require('cli-table');

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "utboot",
    database: "Bamazon"
});

connection.connect(function(err) {
     if (err) throw err;
});

var printTable = function() {
  connection.query('SELECT * FROM Products', function(err, res) {
      console.log("");
      console.log("----------------------------------------------------");
      for (var i = 0; i < res.length; i++) {
          console.log(res[i].ItemID + " | " + res[i].ProductName + " | " + res[i].DepartmentName + " | " + res[i].Price + " | " + res[i].StockQuantity);
      }
      console.log("----------------------------------------------------");
      questions();
  });
};
printTable();

function questions() {
  inquirer.prompt([
  {
    type: "input",
    message: "Welcome to The Rayon Street (Not to be confused with The Silk Road. We're on the shallow web!) What is the ID of the item you would like to purchase?",
    name: "idSelect"
  },
  {
    type:"input",
    message: "How many would you like to purchase? (Type Q to Quit)",
    name: "quantity"
  }
  ]).then(function(answers){
    if (answers.quantity === 'Q') {
      connection.end();
      process.exit();
      return;
    }
    chosenItem = answers.idSelect;
    itemQuantity = answers.quantity;

    connection.query('SELECT ItemID, ProductName, DepartmentName, Price, StockQuantity FROM Products WHERE ItemID= ' + chosenItem,
      function(err, res) {
      if(err) throw err;
      if(res[0].StockQuantity < itemQuantity){
        console.log("Insufficient quantity, there isn\'t enough of this item in stock. Please select an amount that is less than or equal to " + res[0].StockQuantity);
      }
      else {
        connection.query("UPDATE Products SET? WHERE?",
          [{StockQuantity: res[0].StockQuantity - itemQuantity}, {ItemID: chosenItem}],
          function(err, result){});
      if (itemQuantity === '1') {
        console.log("Total Cost: $" + (res[0].Price * itemQuantity) + " for buying " + itemQuantity + " " + res[0].ProductName);
      } else {
          console.log("Total Cost: $" + (res[0].Price * itemQuantity) + " for buying " + itemQuantity + " " + res[0].ProductName + "s");
      }
      console.log("Store database has been updated");
      printTable();
      }
    });
  });
}
