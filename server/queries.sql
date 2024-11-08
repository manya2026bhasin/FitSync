CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE personaldetails (
    personal_id SERIAL PRIMARY KEY,
    pname VARCHAR(30),
    age INTEGER,
    gender VARCHAR(10),
    height INTEGER,
    weight INTEGER,
    goal VARCHAR(50),
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE food_log (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    food_name VARCHAR(100) NOT NULL,
    quantity DECIMAL(10, 2) NOT NULL,
    calories DECIMAL(10, 2) NOT NULL,
    log_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE daily_log(
	user_id INT,
	calories INT,
    water_glasses INT,
	log_date DATE,
	FOREIGN KEY(user_id) REFERENCES users(user_id)
);
ALTER TABLE daily_log ADD CONSTRAINT unique_user_date UNIQUE (user_id, log_date);