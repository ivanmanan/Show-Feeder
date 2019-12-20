const express = require('express'),
      app = express(),
      port = 3000;

const SUCCESS = 200;
const SERVER_ERROR = 500;

app.listen(port);

console.log("Show Feeder RESTful API server started on:", port);

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

app.get("/get/:type", (req, res) => {

  // table can be either "shows" or "favorites"
  const table = req.params.type;

  console.log("Running query...");
  const query = `SELECT * FROM ${table};`;
  console.log(query, "\n");

  connection.query(query, (err, shows, fields) => {
    try {
      if(err) {
        throw err;
      }
      res.status(SUCCESS);
      res.contentType("application/json");

      const listShows = shows.map(s => s.title);

      res.send(JSON.stringify(listShows));
    }
    catch(e) {
      errorMessage(e);
      const empty = [];
      res.status(SERVER_ERROR);
      res.contentType("application/json");
      res.send(JSON.stringify(empty));
    }
  });
});


app.post("/addShow", (req, res) => {

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
      res.status(SUCCESS);
    }
    catch(e) {
      errorMessage(e);
      res.status(SERVER_ERROR);
    }
  });
});


app.post("/addFavorite", (req, res) => {
  const title = "testing";

  console.log("Running query...");
  const query = `INSERT INTO favorites (title) VALUES ("${title}");`;
  console.log(query + "\n");

  connection.query(query, (err, shows, fields) => {
    try {
      if(err) {
        throw err;
      }
      res.status(SUCCESS);
    }
    catch(e) {
      errorMessage(e);
      res.status(SERVER_ERROR);
    }
  });
})


app.delete("/remove/:type/:title", (req, res) => {

  const title = req.params.title;
  const table = req.params.type;

  console.log("Running query...");
  const query = `DELETE FROM ${table} WHERE title="${title}";`;
  console.log(query, "\n");

  connection.query(query, (err, shows, fields) => {
    try {
      if(err) {
        throw err;
      }
      res.status(SUCCESS);

    }
    catch(e) {
      errorMessage(e);
      res.status(SERVER_ERROR);
    }
  });

});