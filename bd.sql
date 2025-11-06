CREATE DATABASE tienda;

USE tienda;

CREATE TABLE IF NOT EXISTS  usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(120) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL,
role ENUM ('user','admin') NOT NULL DEFAULT 'user',
two_factor_enabled TINYINT(1) NOT NULL DEFAULT 0,
two_factor_method ENUM('totp','email') DEFAULT 'totp',
two_factor_secret VARCHAR(255) NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




CREATE TABLE IF NOT EXISTS  usuario_otps(
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
code_hash VARCHAR(255) NOT NULL,
expires_at DATETIME NOT NULL,
used TINYINT(1) DEFAULT 0,
INDEX(user_id)
);