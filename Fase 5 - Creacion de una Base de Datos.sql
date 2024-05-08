CREATE SCHEMA proyecto_cinemextract;
USE proyecto_cinemextract;

-- FASE 1: Tabla para almacenar información sobre películas.
CREATE TABLE Peliculas (
    Id_Pelicula VARCHAR(10) AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(10),
    Nombre VARCHAR(50),
    Año INTEGER,
    Mes INTEGER
);

-- FASE 2: Tabla para almacenar información detallada sobre películas.
CREATE TABLE Detalles_Peliculas (
    Id_Pelicula VARCHAR(10) AUTO_INCREMENT PRIMARY KEY,
    Puntuacion_IMDB FLOAT,
    Puntuacion_Rotten_Tomatoes INTEGER,
    Director VARCHAR(50),
    Guionistas VARCHAR(100),
    Argumento TEXT,
    Duracion VARCHAR(10),
    FOREIGN KEY (Id_Pelicula) REFERENCES Peliculas(Id)
);

-- FASE 3: Tabla para almacenar información sobre actores.
CREATE TABLE Actores (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Año_Nacimiento INTEGER,
    Biografia TEXT
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

-- Tabla para almacenar información sobre las películas en las que actúa cada actor.
CREATE TABLE Actores_Peliculas (
    Id_Actor INTEGER,
    Id_Pelicula INTEGER,
    PRIMARY KEY (Id_Actor, Id_Pelicula),
    FOREIGN KEY (Id_Actor) REFERENCES Actores(Id),
    FOREIGN KEY (Id_Pelicula) REFERENCES Peliculas(Id)
);