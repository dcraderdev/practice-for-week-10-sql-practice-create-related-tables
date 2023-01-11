-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);
CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100)
);
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);


-- To add an attribute to the musicians table that can be used as a foreign key for bands, you would need to add a new column to the musicians table, and set it up as a foreign key that references the id column of the bands table. Here's an example of how you could do this:


-- Add a new column called band_id to the musicians table
ALTER TABLE musicians
ADD COLUMN band_id INTEGER;

-- Define the band_id column as a foreign key that references the id column of the bands table
ALTER TABLE musicians
ADD FOREIGN KEY (band_id) REFERENCES bands(id);

CREATE TABLE musician_instruments (
  musician_id INTEGER NOT NULL,
  instrument_id INTEGER NOT NULL,
  PRIMARY KEY (musician_id, instrument_id),
  FOREIGN KEY (musician_id) REFERENCES musicians(id),
  FOREIGN KEY (instrument_id) REFERENCES instruments(id)
);
