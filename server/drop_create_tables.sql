CREATE DATABASE IF NOT EXISTS showfeeder;
use showfeeder;


DROP TABLE IF EXISTS shows;

CREATE TABLE shows (
       id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
       title varchar(255) NOT NULL UNIQUE,
       day INT NOT NULL,
       month varchar(30) NOT NULL,
       year INT NOT NULL
);

CREATE TABLE favorites (
       id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
       title varchar(255) NOT NULL UNIQUE
);

INSERT INTO shows (title, day, month, year) VALUES ("Bojack Horseman: Season 6 (Pt 2)", 31, "January", 2020);

INSERT INTO favorites (title) VALUES ("American Dad");
INSERT INTO favorites (title) VALUES ("Rick and Morty");
INSERT INTO favorites (title) VALUES ("Family Guy");
INSERT INTO favorites (title) VALUES ("South Park");

INSERT INTO favorites (title) VALUES ("The Mandalorian");

INSERT INTO favorites (title) VALUES ("Big Mouth");
INSERT INTO favorites (title) VALUES ("The Society");
INSERT INTO favorites (title) VALUES ("The Bojack Horseman Show");
INSERT INTO favorites (title) VALUES ("Stranger Things");
INSERT INTO favorites (title) VALUES ("Love, Death, and Robots");
INSERT INTO favorites (title) VALUES ("How to Sell Drugs Online Fast");
INSERT INTO favorites (title) VALUES ("Sex Education");

INSERT INTO favorites (title) VALUES ("The Haunting of Hill House");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
INSERT INTO favorites (title) VALUES ("");
