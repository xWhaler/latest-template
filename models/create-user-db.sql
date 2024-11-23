-- This file contains the SQL code to create the user_db database and the users table.

-- Optionally, you can just run this file in your MySQL management tool.

-- After installing MySQL, you can run "source /path/to/create-user-db.sql;" in the MySQL terminal.

-- Example for terminal: Sudo pacman -S mysql; mysql -u root -p; CREATE DATABASE user_db; USE user_db;

CREATE DATABASE user_db;

USE user_db;

CREATE TABLE users
(
    user_id               INT AUTO_INCREMENT PRIMARY KEY,
    username              VARCHAR(50)  NOT NULL UNIQUE,
    email                 VARCHAR(100) NOT NULL UNIQUE,
    password_hash         VARCHAR(255) NOT NULL,
    role                  ENUM ('user', 'admin', 'moderator')   DEFAULT 'user',
    created_at            TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP,
    updated_at            TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login            TIMESTAMP    NULL,
    account_status        ENUM ('active', 'inactive', 'banned') DEFAULT 'active',
    failed_login_attempts INT                                   DEFAULT 0,
    password_reset_token  VARCHAR(255) NULL,
    token_expiry          TIMESTAMP    NULL
);
