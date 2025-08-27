CREATE DATABASE clima_alerta;

CREATE TABLE TipoEvento (
    idTipoEvento SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(255)
);

CREATE TABLE Localizacao (
    idLocalizacao SERIAL PRIMARY KEY,
    latitude FLOAT,
    longitude FLOAT,
    cidade VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE CategoriaUsuario (
    idCategoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) 
);

CREATE TABLE Usuario (
    idUsuario SERIAL PRIMARY KEY,
    nome VARCHAR(150),
    email VARCHAR(150) UNIQUE,
    senhaHash VARCHAR(255),
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES CategoriaUsuario(idCategoria)
);

CREATE TABLE Evento (
    idEvento SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    descricao TEXT,
    dataHora TIMESTAMP,
    status VARCHAR(50), 
    idTipoEvento INT,
    idLocalizacao INT,
    FOREIGN KEY (idTipoEvento) REFERENCES TipoEvento(idTipoEvento),
    FOREIGN KEY (idLocalizacao) REFERENCES Localizacao(idLocalizacao)
);

CREATE TABLE Relato (
    idRelato SERIAL PRIMARY KEY,
    texto TEXT,
    dataHora TIMESTAMP,
    idEvento INT,
    idUsuario INT,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Alerta (
    idAlerta SERIAL PRIMARY KEY,
    mensagem TEXT,
    dataHora TIMESTAMP,
    nivel VARCHAR(50),
    idEvento INT,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento)
);

