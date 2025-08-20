CREATE DATABASE clima_alerta;

USE clima_alerta;

CREATE TABLE TipoEvento (
    idTipoEvento INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(255)
);

CREATE TABLE Localizacao (
    idLocalizacao INT PRIMARY KEY,
    latitude FLOAT,
    longitude FLOAT,
    cidade VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY,
    nome VARCHAR(150),
    email VARCHAR(150),
    senhaHash VARCHAR(255)
);

CREATE TABLE Evento (
    idEvento INT PRIMARY KEY,
    titulo VARCHAR(255),
    descricao TEXT,
    dataHora DATETIME,
    status VARCHAR(50), 
    idTipoEvento INT,
    idLocalizacao INT,
    FOREIGN KEY (idTipoEvento) REFERENCES TipoEvento(idTipoEvento),
    FOREIGN KEY (idLocalizacao) REFERENCES Localizacao(idLocalizacao)
);

CREATE TABLE Relato (
    idRelato INT PRIMARY KEY,
    texto TEXT,
    dataHora DATETIME,
    idEvento INT,
    idUsuario INT,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Alerta (
    idAlerta INT PRIMARY KEY,
    mensagem TEXT,
    dataHora DATETIME,
    nivel VARCHAR(50),
    idEvento INT,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento)
);

CREATE TABLE CategoriaUsuario (
    idCategoria INT PRIMARY KEY,
    nome VARCHAR(50) 
);

