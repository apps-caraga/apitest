--
-- File generated with SQLiteStudio v3.4.4 on Tue Apr 16 08:34:47 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: offices
CREATE TABLE IF NOT EXISTS offices (
    id              INTEGER  PRIMARY KEY AUTOINCREMENT,
    office_nickname TEXT (6) UNIQUE,
    office_name     TEXT     UNIQUE
                             NOT NULL,
    created_at      DATETIME NOT NULL
                             DEFAULT (CURRENT_TIMESTAMP) 
);


-- Table: reports
CREATE TABLE IF NOT EXISTS reports (
    id         INTEGER  PRIMARY KEY AUTOINCREMENT,
    subject    TEXT     UNIQUE
                        NOT NULL,
    content    TEXT     NOT NULL,
    created_by INTEGER  REFERENCES users (id) 
                        NOT NULL,
    created_at DATETIME NOT NULL
                        DEFAULT (CURRENT_TIMESTAMP) 
);


-- Table: roles
CREATE TABLE IF NOT EXISTS roles (
    id         INTEGER  PRIMARY KEY AUTOINCREMENT,
    role_name  TEXT     UNIQUE
                        NOT NULL,
    created_at DATETIME NOT NULL
                        DEFAULT (CURRENT_TIMESTAMP) 
);


-- Table: users
CREATE TABLE IF NOT EXISTS users (
    id         INTEGER  PRIMARY KEY AUTOINCREMENT,
    username   TEXT     UNIQUE
                        NOT NULL,
    password   TEXT     NOT NULL,
    role_id    INTEGER  REFERENCES roles (id),
    office_id  INTEGER  REFERENCES offices (id),
    created_at DATETIME NOT NULL
                        DEFAULT (CURRENT_TIMESTAMP),
    updated_at DATETIME
);


-- Trigger: SET_UPDATED_AT
CREATE TRIGGER IF NOT EXISTS SET_UPDATED_AT
                       AFTER UPDATE OF password,
                                       role_id
                          ON users
BEGIN
    UPDATE users
       SET updated_at = CURRENT_TIMESTAMP
     WHERE id = OLD.id;
END;


-- View: active_users
CREATE VIEW IF NOT EXISTS active_users AS
    SELECT users.id,
           username,
           password,
           role_id,
           role_name,
           office_id,
           office_name,
           office_nickname
      FROM users
           LEFT JOIN
           roles ON roles.id = users.role_id
           LEFT JOIN
           offices ON offices.id = users.office_id
     WHERE role_id IS NOT NULL AND 
           office_id IS NOT NULL;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
