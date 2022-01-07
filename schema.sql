CREATE TABLE Author (
  id INT,
  first_name VARCHAR(120),
  last_name VARCHAR(120),
  PRIMARY KEY (id)
);
CREATE TABLE source (
  id INT,
  name VARCHAR(120),
  PRIMARY KEY (id)
);
CREATE TABLE label (
  id INT,
  title VARCHAR(120),
  color VARCHAR(120),
  PRIMARY KEY (id)
);
CREATE TABLE item (
  id INT,
  author_id INT,
  lable_id INT,
  source_id INT,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id),
  CONSTRAINT author_id
    FOREIGN KEY (author_id)
      REFERENCES Author(id),
  CONSTRAINT lable_id
    FOREIGN KEY (lable_id)
      REFERENCES source(id),
  CONSTRAINT source_id
    FOREIGN KEY (source_id)
      REFERENCES label(id)
);
CREATE TABLE book (
  id INT,
  name VARCHAR(120),
  publisher VARCHAR(120),
  cover_state VARCHAR(120),
  PRIMARY KEY (id),
  CONSTRAINT id
    FOREIGN KEY (id)
      REFERENCES item(id)
);
CREATE TABLE music_album (
  id INT,
  name VARCHAR(120),
  on_spotify VARCHAR(120),
  PRIMARY KEY (id),
  CONSTRAINT id
    FOREIGN KEY (id)
      REFERENCES item(id)
);
CREATE TABLE game (
  id INT,
  name VARCHAR(120),
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY (id),
  CONSTRAINT id
    FOREIGN KEY (id)
      REFERENCES item(id)
);