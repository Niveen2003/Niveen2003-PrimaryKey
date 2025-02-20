-- As mentioned before, primary keys are used as unique identifiers for
--  other tables to refer to them. A column that refers to some other record
--  in the database is referred to as a 'foreign key' and is generally subject
--  to rules referred to as 'referential integrity'. For instance, the below
--  table may represent a blogpost which is written by a particular site_user.
--      CREATE TABLE Blogpost (
--          id SERIAL PRIMARY KEY,
--          title VARCHAR(255),
--          text VARCHAR(255),
--          user_fk INTEGER REFERENCES Site_User(id)
--          );
-- In that case, a Blogpost with user_fk '1' refers to the record in Site_User
--  with a primary key '1'.
-- A foreign key may either refer to an existing primary key or be null.
--  Referential integrity mandates that SQL will not allow any record that
--  attempts to refer to a non-existent primary key, and also will not allow
--  the deletion or change of a primary key that has records referring to it.
-- A table may have multiple foreign keys, and it may also have foreign keys
--  pointing to its own table.
-- Consider the below 'Artist' and 'Album' tables below:
--      Artist table
--      | id    | name              |
--      |-------|-------------------|
--      | 1     | 'Peter Gabriel'   |
--      | 2     | 'Phil Collins'    |
--      | 3     | 'Kate Bush'       |
--      Album table
--      | id | title          | artist_fk |
--      -----------------------------------
--      | 1  | 'Melt'         | 1         |
--      | 2  | 'So'           | 1         |
--      | 3  | 'The Dreaming' | 3         |
-- Notice that it's acceptable for multiple records to contain the same fk,
--  meaning, both Albums with id's of '1' and '2' are associated with the Artist
--  with id '1', and it's also acceptable for a primary key to have no foreign
--  keys pointing to it. It is also acceptable for a table to have multiple foreign
--  keys, or a foreign key associated with its own table's primary key.
-- TODO: Create a table called 'Album' with the three columns listed, where
--  'id' is the table's primary key, and 'artist_fk' is a foreign key referencing
--  the 'id' column of 'Artist', which was defined in lab1.sql.