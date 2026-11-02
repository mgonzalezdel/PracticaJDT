// Personajes (characters.csv)
LOAD CSV WITH HEADERS FROM 'file:///characters.csv' AS row
MERGE (c:Character {link: row.link})
ON CREATE SET c.name = row.character;

// Casas / Organizaciones (houses.csv)
LOAD CSV WITH HEADERS FROM 'file:///houses.csv' AS row
MERGE (h:House {link: row.link})
ON CREATE SET h.name = row.name;

// Episodios (overview.csv)
LOAD CSV WITH HEADERS FROM 'file:///overview.csv' AS row
MERGE (e:Episode {id: toInteger(row.episodeId)})
ON CREATE SET 
    e.season = toInteger(row.season),
    e.episode = toInteger(row.episode),
    e.title = row.title;

// Ubicaciones (locations.csv)
LOAD CSV WITH HEADERS FROM 'file:///locations.csv' AS row
MERGE (l:Location {id: row.locationId})
ON CREATE SET l.name = row.locationName;