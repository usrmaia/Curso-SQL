show databases;
create database IF NOT EXISTS first_example;
use first_example;

CREATE TABLE person(
	person_id SMALLINT UNSIGNED, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM("M", "F", "Others"),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_cod VARCHAR(20),
    
    CONSTRAINT pk_person PRIMARY KEY (person_id)
);

DESC person;
SELECT * FROM person;

INSERT INTO person VALUES 
	("2", "AAAAA", "MBBBBBBb", "M", "2001-07-25", "Rua L" , "Russas", "Brasil", "Ceará", "62900-000");

DELETE FROM person WHERE person_id = "2";

CREATE TABLE favorite_food (
	person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    
    CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_favorite_food_person_id FOREIGN KEY (person_id)
    REFERENCES person(person_id)
);

DESC favorite_food;
SELECT * from favorite_food;

INSERT INTO favorite_food VALUES 
	("1", "Lasanha");