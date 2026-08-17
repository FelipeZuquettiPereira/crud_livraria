
CREATE DATABASE sistema_pratos;
USE sistema_pratos;

CREATE TABLE usuario (
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL
 )

CREATE TABLE pratos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    descicao VARCHAR(100)NOT NULL,
    preco FLOAT NOT NULL,
    categoria VARCHAR(200) NOT NULL
);