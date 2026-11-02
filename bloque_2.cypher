// Ejer 11: IMPOSIBLE. El dataset instanciado carece de la relación de asesinatos (KILLED).

// Ejer 12: Cambio de Fidelidad (Transfuguismo)
// Se captura el patrón completo de pertenencia pasada y actual asignándolo a la variable de ruta 'p'.
MATCH p=(casaAnterior:House)<-[:PREVIOUSLY_BELONGED_TO]-(c:Character)-[:BELONGS_TO]->(casaActual:House)
RETURN p
LIMIT 25;

// Ejer 13: Búsqueda de Sobrinos Directos (Adaptado)
// Ante la falta de la arista SIBLING_OF, se triangula la hermandad subiendo al nodo abuelo común mediante PARENT_OF.
MATCH p=(tyrion:Character)<-[:PARENT_OF]-(abuelo:Character)-[:PARENT_OF]->(hermano:Character)-[:PARENT_OF]->(sobrino:Character)
WHERE tyrion.name CONTAINS 'Tyrion Lannister'
  AND hermano <> tyrion
RETURN p
LIMIT 25;

// Ejer 14: IMPOSIBLE. Falta la dimensión factual de muertes (KILLED) requerida para la agregación.
