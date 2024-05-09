CREATE SCHEMA proyecto_cinemextract;
USE proyecto_cinemextract;

-- FASE 1: Tabla para almacenar información general.
CREATE TABLE Informacion_peliculas (
    Id_Pelicula VARCHAR(10) AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(30),
    Año YEAR,
    Genero VARCHAR(20)
);

-- FASE 2: Tabla para almacenar información detallada sobre películas.
CREATE TABLE Detalles_peliculas (
    Id_Pelicula VARCHAR(10) AUTO_INCREMENT PRIMARY KEY,
	Director VARCHAR(50),
	Guionistas VARCHAR(100),
    Reparto VARCHAR(100),
    Duracion VARCHAR(10),
	Argumento VARCHAR(150),
    Puntuacion_IMDB FLOAT,
    Puntuacion_Rotten_Tomatoes VARCHAR(4));
-- FOREIGN KEY (Id_Pelicula) REFERENCES Peliculas(Id)
    
-- FASE 3: Tabla para almacenar información sobre actores.
CREATE TABLE Actores (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Actor VARCHAR(50),
    Actriz VARCHAR(50),
    Biografia INTEGER,
    Premios VARCHAR(100),
    Conocido_Por VARCHAR(100)
);

-- FASE 4: Tabla para almacenar información sobre los Premios Oscar.
CREATE TABLE Premios_Oscar (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Fecha_Ceremonia INTEGER,
    Mejor_Pelicula VARCHAR(20),
    Mejor_Director VARCHAR(50),
    Mejor_Actor VARCHAR(50),
    Mejor_Actriz VARCHAR(50)
);