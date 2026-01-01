-- Use your database
USE fittrack;

-- 1️⃣ Users table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2️⃣ Workout table
CREATE TABLE IF NOT EXISTS Workout (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category VARCHAR(100),
    workout_name VARCHAR(100),
    sets INT,
    reps INT,
    weight FLOAT,
    duration INT,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 3️⃣ Blog table
CREATE TABLE IF NOT EXISTS Blog (
    blog_id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT NOT NULL,
    title VARCHAR(255),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 4️⃣ Tutorial table
CREATE TABLE IF NOT EXISTS Tutorial (
    tutorial_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    thumbnail TEXT,
    videourl TEXT
);

-- 5️⃣ DailyStat table
CREATE TABLE IF NOT EXISTS DailyStat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    calories_burned FLOAT DEFAULT 0,
    workout_duration INT DEFAULT 0,
    steps INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 6️⃣ WeeklyStat table
CREATE TABLE IF NOT EXISTS WeeklyStat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    week_start DATE NOT NULL,
    total_workouts INT DEFAULT 0,
    total_duration INT DEFAULT 0,
    total_calories FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 7️⃣ WorkoutStat table
CREATE TABLE IF NOT EXISTS WorkoutStat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    workout_name VARCHAR(100),
    total_sets INT DEFAULT 0,
    total_reps INT DEFAULT 0,
    total_weight FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
