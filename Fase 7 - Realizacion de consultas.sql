-- Fase 7: Realización de Consultas para Obtener Información.

USE proyecto_cinemextract;

-- 1. ¿Qué géneros han recibido más premios Óscar?
SELECT Genero, COUNT(o.ID_titulo) AS total_premios
FROM informacion_peliculas AS i
JOIN premios_oscar AS o
ON i.ID_titulo = o.ID_titulo
GROUP BY Genero
ORDER BY total_premios DESC;


-- 2. ¿Qué género es el mejor valorado en IMDB?
SELECT AVG(Puntuacion_IMDB) AS promedio, Genero
FROM informacion_peliculas AS i
JOIN detalles_peliculas AS d
ON i.ID_titulo = d.ID_titulo
GROUP BY Genero
ORDER BY promedio DESC;

-- 3. ¿En que año se estrenaron más películas?
SELECT COUNT(ID_titulo) AS estrenos, Año, Tipo
FROM informacion_peliculas
WHERE tipo LIKE "Movie"
GROUP BY Año, Tipo
ORDER BY estrenos DESC;

-- 4. ¿En que año se estrenaron mas cortos?
SELECT COUNT(Año) AS estrenos, Año, Tipo
FROM informacion_peliculas
WHERE tipo = "short"
GROUP BY Año
ORDER BY estrenos DESC
LIMIT 1;  -- opcional: para ver sólo un resultado (en este caso concreto, el año con más cortos estrenados) --

/* 5. ¿Cuál es la mejor serie valorada en IMDB?
No realizamos la consulta puesto que no tenemos series en nuestra base de datos (confirmado con el instructor). */

-- 6. ¿Cuál es la película mejor valorada en IMDB?
SELECT d.ID_titulo, d.Nombre, i.Tipo, Puntuacion_IMDB
FROM detalles_peliculas AS d
JOIN informacion_peliculas AS i
ON d.ID_titulo = i.ID_titulo
WHERE tipo LIKE "Movie"
GROUP BY d.ID_titulo, d.Nombre
ORDER BY Puntuacion_IMDB DESC
LIMIT 2;  -- opcional: para ver los dos primeros resultados (en este caso concreto, hay dos películas con la misma puntuación) --

-- 7. ¿Qué actor/actriz ha recibido más premios?
SELECT mejor_actor,mejor_actriz, COUNT(*) AS total_premios
FROM premios_oscar
GROUP BY mejor_actriz,mejor_actor
ORDER BY total_premios;

SELECT COUNT(ID_titulo) AS estrenos, Año
FROM informacion_peliculas
WHERE Año = 2012;

-- PENDIENTE DE TERMINAR LA FASE 3 --

-- 8. ¿Hay algun actor/actriz que haya recibido más de un premio Óscar?

-- Consulta para mejor actor
SELECT mejor_actor AS nombre, COUNT(*) AS premios
FROM premios_oscar
GROUP BY mejor_actor
HAVING premios > 1

UNION ALL

-- Consulta para mejor actriz
SELECT mejor_actriz AS nombre, COUNT(*) AS premios
FROM premios_oscar
GROUP BY mejor_actriz
HAVING premios > 1;