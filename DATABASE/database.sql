CREATE DATABASE IF NOT EXISTS Tienda;
USE DATABASE Tienda;

CREATE TABLE IF NOT EXISTS t_usuarios(
    id_usuario INT(11) auto_increment NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(255) NOT NULL,
    roll VARCHAR(20),
    imagen VARCHAR(255),
    CONSTRAINT pk_usuario PRIMARY KEY(id_usuario),
    CONSTRAINT uq_email UNIQUE(email)
) ENGINE=InnoDb;

INSERT INTO t_usuarios VALUES (NULL,'Admin','Admin', 'admin@admin.com','1234', 'admin','imagen')

