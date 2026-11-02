// Ejer 01: IMPOSIBLE. El atributo 'gender' no existe en el dataset original (characters.csv).

// Ejer 02: Funcional. Se usa CONTAINS para flexibilizar la búsqueda del nombre de la casa.
MATCH p=(c:Character)-[:BELONGS_TO]->(h:House)
WHERE h.name CONTAINS 'Stark'
RETURN p
LIMIT 25;

// Ejer 03: IMPOSIBLE. No existen datos de asesinatos (KILLED) en los scripts de ingesta proporcionados.

// Ejer 04: Funcional. Adaptado a la relación real [:APPEARS_IN] del script JuegoTronos03.cypher.
MATCH (c:Character)-[:APPEARS_IN]->(e:Episode)
RETURN e.title AS Titulo, e.season AS Temporada, count(c) AS Participantes
ORDER BY Participantes DESC
LIMIT 5;

// Ejer 05: IMPOSIBLE. El archivo houses.csv no contiene mapeo geográfico (LOCATED_IN).

// Ejer 06: Funcional. Búsqueda directa del nodo padre.
MATCH p=(padre:Character)-[:PARENT_OF]->(hijo:Character)
WHERE padre.name CONTAINS 'Tywin Lannister'
RETURN p;

// Ejer 07: IMPOSIBLE. Falta relación espacial (LOCATED_IN).

// Ejer 08: Funcional. Uso de predicado negativo.
MATCH (c:Character)
WHERE NOT (c)-[:BELONGS_TO]->(:House)
RETURN c.name AS Personaje;

// Ejer 09: Funcional. Adaptado a la propiedad real 'episode' del script JuegoTronos02.cypher.
MATCH (e:Episode {season: 1})
RETURN e.title AS Titulo, e.episode AS Episodio
ORDER BY Episodio ASC;

// Ejer 10: IMPOSIBLE. El archivo family_ties.csv no registra vínculos matrimoniales (MARRIED_TO).