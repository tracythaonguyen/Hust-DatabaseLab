create table book (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50)  NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50)
);