CREATE DATABASE IF NOT EXISTS Tienda;
USE Tienda;

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

INSERT INTO t_usuarios VALUES (NULL,'Admin','Admin', 'admin@admin.com','1234', 'admin','imagen');

CREATE TABLE IF NOT EXISTS t_categorias(
    id_categoria        int(11) auto_increment  NOT NULL,
    nombre_categoria    varchar(100)            NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY(id_categoria)
)ENGINE=InnoDb;

INSERT INTO t_categorias VALUE(NULL, 'Construcccion'),(null,'Electricos'),(null,'Pisos');

CREATE TABLE IF NOT EXISTS t_productos(
    id_producto         int(11) auto_increment  NOT NULL,
    nombre_producto     varchar(100)            NOT NULL,
    descripcion         VARCHAR(200)            NOT NULL,
    precio              float(100,2)            NOT NULL,
    stock               int(100)                NOT NULL,
    oferta              varchar(50)             NOT NULL,
    fecha               date                    NOT NULL,
    imagen              varchar(255),
    id_categoria        int(11)                 NOT NULL,
    CONSTRAINT          pk_producto             PRIMARY KEY(id_producto),
    CONSTRAINT          fk_producto_categoria   FOREIGN KEY(id_categoria) REFERENCES t_categorias(id_categoria)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS t_pedidos(
    id_pedido           int(11) auto_increment  NOT NULL,
    id_usuario          int(11)                 NOT NULL,
    ciudad              varchar(35)             NOT NULL,
    direccion           varchar(55)             NOT NULL,
    costo               int(11)                 NOT NULL,
    fecha               date                    NOT NULL,
    hora                time                    NOT NULL,
    estado              varchar(50)             NOT NULL,
    CONSTRAINT          pk_pedido               PRIMARY KEY(id_pedido),
    CONSTRAINT          fk_pedido_usuario       FOREIGN KEY(id_usuario) REFERENCES t_usuarios(id_usuario)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS detalle_pedidos(
    id_detalle_pedidos  INT(11) auto_increment NOT NULL,
    id_pedido           INT(11)                NOT NULL,
    id_producto         INT(11)                NOT NULL,
    unidades            INT(10)                NOT NULL,
    CONSTRAINT          pk_detalle_pedidos     PRIMARY KEY(id_detalle_pedidos),
    CONSTRAINT          fk_id_pedido           FOREIGN KEY(id_pedido) REFERENCES t_pedidos(id_pedido),
    CONSTRAINT          fk_id_producto         FOREIGN KEY(id_producto) REFERENCES t_productos(id_producto)
)ENGINE=InnoDb;



