// Ejer 15: Supervivientes Multitemporada
// Se requiere tabla de agregación, no es compatible con el formato de grafo (p).
MATCH (c:Character)-[:APPEARS_IN]->(e:Episode)
WITH c, count(DISTINCT e.season) AS temporadas
WHERE temporadas >= 6
RETURN c.name AS Personaje, temporadas AS TotalTemporadas
ORDER BY TotalTemporadas DESC;

// Ejer 16: Camino más Corto entre Linajes
// Se utiliza la función shortestPath permitiendo cualquier tipo de relación (hasta 10 saltos por rendimiento).
MATCH p=shortestPath((d:Character)-[*..10]-(a:Character))
WHERE d.name CONTAINS 'Daenerys Targaryen' AND a.name CONTAINS 'Arya Stark'
RETURN p;

// Ejer 17: Relaciones de Abuelos y Nietos
// Dos saltos consecutivos direccionales de la relación de paternidad.
MATCH p=(abuelo:Character)-[:PARENT_OF]->(padre:Character)-[:PARENT_OF]->(nieto:Character)
RETURN p
LIMIT 25;

// Ejer 18: IMPOSIBLE. No existen registros de muertes (KILLED) para cruzar con episodios.

// Ejer 19: IMPOSIBLE. No existen registros de muertes (KILLED).

// Ejer 20: Grado de Interconexión Social (Centralidad)
// Agregación tabular descartando las apariciones en episodios para evitar distorsión en la centralidad de grado.
MATCH (c:Character)-[r]-()
WHERE type(r) <> 'APPEARS_IN'
WITH c, count(r) AS Conexiones
ORDER BY Conexiones DESC
LIMIT 10
RETURN c.name AS Personaje, Conexiones;