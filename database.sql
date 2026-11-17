CREATE DATABASE IF NOT EXISTS visit_hail CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE visit_hail;
CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(190) NOT NULL UNIQUE,password_hash VARCHAR(255) NOT NULL,role ENUM('visitor','admin') NOT NULL DEFAULT 'visitor',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS tours (id INT AUTO_INCREMENT PRIMARY KEY,title VARCHAR(150) NOT NULL,location VARCHAR(150) NOT NULL,description TEXT NOT NULL,price DECIMAL(10,2) NOT NULL,capacity INT NOT NULL DEFAULT 10,active TINYINT(1) NOT NULL DEFAULT 1);
CREATE TABLE IF NOT EXISTS bookings (id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NOT NULL,tour_id INT NOT NULL,tour_date DATE NOT NULL,visitors INT NOT NULL,total_price DECIMAL(10,2) NOT NULL,status ENUM('confirmed','cancelled') NOT NULL DEFAULT 'confirmed',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(user_id) REFERENCES users(id),FOREIGN KEY(tour_id) REFERENCES tours(id),INDEX(tour_id,tour_date,status));
INSERT INTO tours(title,location,description,price,capacity) VALUES
('Aja Mountains Walk','Aja Mountains','A guided introduction to the Aja mountain landscape.',100.00,12),
('Salma Scenic Tour','Salma Mountains','A short sightseeing trip around the Salma mountain area.',120.00,10),
('Ha'il Heritage Visit','Ha'il City','Explore local heritage and learn about the region.',80.00,15);
