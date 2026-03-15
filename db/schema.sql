CREATE TABLE races (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name_en TEXT NOT NULL,
  name_it TEXT NOT NULL,
  description_en TEXT,
  description_it TEXT
);

CREATE TABLE equipment (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name_en TEXT NOT NULL,
  name_it TEXT NOT NULL,
  category TEXT NOT NULL,
  weight REAL,
  cost_gp REAL
);

CREATE TABLE spells (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name_en TEXT NOT NULL,
  name_it TEXT NOT NULL,
  level INTEGER NOT NULL,
  school TEXT NOT NULL,
  description_en TEXT,
  description_it TEXT
);

CREATE TABLE classes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name_en TEXT NOT NULL,
  name_it TEXT NOT NULL
);
