const express = require('express'),
      app = express(),
      port = process.env.PORT || 3000;

app.listen(port);

console.log('Show Feeder RESTful API server started on: ' + port);

/////////////////////////////////////////////////////////////////////
// Auxiliary Functions
function errorMessage(message) {
  console.log("\x1b[36m%s\x1b[0m", "ERROR: " + message + "\n");
}


/////////////////////////////////////////////////////////////////////
// MySQL Database

const mysql = require("mysql");
const config = require("./configs");
const db = config.database;

const connection = mysql.createConnection({
  host: db.host,
  user: db.user,
  password: db.password,
  database: db.database
});

connection.connect(function(err) {
  if (err) {
    throw err;
  }
  console.log("You are now connected to the MySQL Database.\n");
});

/////////////////////////////////////////////////////////////////////
// HTTP Methods

app.get("/shows", (req, res) => {

  console.log("Running query...");
  const query = `SELECT * FROM shows;`;
  console.log(query + "\n");

  connection.query(query, (err, shows, fields) => {
    try {
      if(err) {
        throw err;
      }

    }
    catch(e) {
      errorMessage(e);
      const empty = [];
      res.contentType('application/json');
      res.send(JSON.stringify(empty));
    }
  });
});

app.post("/add", (req, res) => {

  const title = "testing";
  const day = 5;
  const month = "January";
  const year = 2020;

  console.log("Running query...");
  const query = `INSERT INTO shows (title, day, month, year) VALUES ("${title}", ${day}, "${month}", ${year});`;
  console.log(query + "\n");

  connection.query(query, (err, shows, fields) => {
    try {
      if(err) {
        throw err;
      }

    }
    catch(e) {
      errorMessage(e);
    }
  });



});

app.put("/update", (req, res) => {

  const title = "testing";
  const day = 5;
  const month = "January";
  const year = 2020;

  console.log("Running query...");
  const query = `UPDATE shows SET title="${title}", day=${day}, month="${month}", year=${year} WHERE title=${title};`;
  console.log(query + "\n");

  connection.query(query, (err, shows, fields) => {
    try {
      if(err) {
        throw err;
      }

    }
    catch(e) {
      errorMessage(e);
    }
  });


});

app.delete("/remove", (req, res) => {

  const title = "testing";

  console.log("Running query...");
  const query = `DELETE FROM shows WHERE title=${title};`;
  console.log(query + "\n");

  connection.query(query, (err, shows, fields) => {
    try {
      if(err) {
        throw err;
      }

    }
    catch(e) {
      errorMessage(e);
    }
  });

});