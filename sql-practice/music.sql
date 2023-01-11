-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;
DROP TABLE IF EXISTS musician_instruments;

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);
CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  band_id INTEGER NOT NULL
);
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);
CREATE TABLE musician_instruments (
  musician_id INTEGER NOT NULL,
  instrument_id INTEGER NOT NULL,
  PRIMARY KEY (musician_id, instrument_id),
  FOREIGN KEY (musician_id) REFERENCES musicians(id),
  FOREIGN KEY (instrument_id) REFERENCES instruments(id)
);



-- -- Add a new column called band_id to the musicians table
-- ALTER TABLE musicians
-- ADD COLUMN band_id INTEGER;

-- -- Define the band_id column as a foreign key that references the id column of the bands table
-- ALTER TABLE musicians
-- ADD FOREIGN KEY (band_id) REFERENCES bands(id);



-- Seed data for the bands table
INSERT INTO bands (name) VALUES ('The Beatles');
INSERT INTO bands (name) VALUES ('Led Zeppelin');
INSERT INTO bands (name) VALUES ('Black Sabbath');

-- Seed data for the musicians table
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('John', 'Lennon', 1);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Paul', 'McCartney', 1);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('George', 'Harrison', 1);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Ringo', 'Starr', 1);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Jimmy', 'Page', 2);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Robert', 'Plant', 2);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('John', 'Bonham', 2);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('John', 'Paul Jones', 2);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Ozzy', 'Osbourne', 3);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Tony', 'Iommi', 3);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Geezer', 'Butler', 3);
INSERT INTO musicians (first_name, last_name, band_id) VALUES ('Bill', 'Ward', 3);

-- Seed data for the instruments table
INSERT INTO instruments (type) VALUES ('Guitar');
INSERT INTO instruments (type) VALUES ('Bass');
INSERT INTO instruments (type) VALUES ('Drums');
INSERT INTO instruments (type) VALUES ('Vocals');
INSERT INTO instruments (type) VALUES ('Keyboard');

-- Seed data for the musician_instruments table
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (1, 1);
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (2, 1);
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (3, 1);
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (4, 2);
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (5, 1);
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (6, 4);
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (7, 3);
INSERT INTO musician_instruments (musician_id, instrument_id) VALUES (8, 5);