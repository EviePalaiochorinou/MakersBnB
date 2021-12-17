CREATE TABLE requests
(ID SERIAL PRIMARY KEY, date VARCHAR (30), user_id INT REFERENCES users(id), space_id INT REFERENCES spaces(id), approved BOOLEAN DEFAULT FALSE);
