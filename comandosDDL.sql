-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS CampusAntiguedadesDB;
USE CampusAntiguedadesDB;

-- Tabla de Roles
CREATE TABLE IF NOT EXISTS Roles (
    idRol INT PRIMARY KEY AUTO_INCREMENT,
    nombreRol VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    contraseña VARCHAR(100),
    idRol INT,
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idRol) REFERENCES Roles(idRol)
);

-- Tabla de Categorías
CREATE TABLE IF NOT EXISTS Categorías (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla de Antigüedades
CREATE TABLE IF NOT EXISTS Antiguedades (
    idAntiguedad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    estadoConservacion VARCHAR(100),
    idCategoria INT,
    fechaAñadido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('en venta', 'vendido', 'retirado'),
    FOREIGN KEY (idCategoria) REFERENCES Categorías(idCategoria)
);

-- Tabla de Fotos
CREATE TABLE IF NOT EXISTS Fotos (
    idFoto INT PRIMARY KEY AUTO_INCREMENT,
    idAntiguedad INT,
    url VARCHAR(255),
    FOREIGN KEY (idAntiguedad) REFERENCES Antiguedades(idAntiguedad)
);

-- Tabla de Transacciones
CREATE TABLE IF NOT EXISTS Transacciones (
    idTransaccion INT PRIMARY KEY AUTO_INCREMENT,
    idComprador INT,
    idVendedor INT,
    idAntiguedad INT,
    precio DECIMAL(10, 2),
    fechaTransaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idComprador) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idVendedor) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idAntiguedad) REFERENCES Antiguedades(idAntiguedad)
);

-- Tabla de Consultas
CREATE TABLE IF NOT EXISTS Consultas (
    idConsulta INT PRIMARY KEY AUTO_INCREMENT,
    idAntiguedad INT,
    fechaConsulta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idAntiguedad) REFERENCES Antiguedades(idAntiguedad)
);
