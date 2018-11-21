CREATE TABLE users (
    id       INTEGER   PRIMARY KEY AUTOINCREMENT
                       NOT NULL
                       UNIQUE,
    name     STRING    NOT NULL,
    email    STRING    UNIQUE
                       NOT NULL,
    password CHAR (60) NOT NULL,
    created  DATE      DEFAULT (date() ) 
                       NOT NULL
);

CREATE TABLE tickets (
    id      INTEGER PRIMARY KEY AUTOINCREMENT
                    UNIQUE
                    NOT NULL,
    title   STRING  NOT NULL,
    [by]    INTEGER REFERENCES users (id) 
                    NOT NULL,
    created DATE    DEFAULT (DATE() ) 
);

CREATE TABLE sessions (
    id   CHAR (256) PRIMARY KEY
                    UNIQUE
                    NOT NULL,
    data STRING
);
