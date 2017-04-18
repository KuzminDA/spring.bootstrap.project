CREATE TABLE IF NOT EXISTS roles
(id BIGINT AUTO_INCREMENT, Role_name VARCHAR(30),
 PRIMARY KEY(id), UNIQUE (Role_name));
INSERT IGNORE INTO roles (Role_name) VALUE ('Admin');
INSERT IGNORE INTO roles (Role_name) VALUE ('User');