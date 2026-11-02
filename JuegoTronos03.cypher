// Pertenencia actual a casas (characters_houses.csv)
LOAD CSV WITH HEADERS FROM 'file:///characters_houses.csv' AS row
MATCH (c:Character {link: row.character})
MATCH (h:House {link: row.house})
MERGE (c)-[:BELONGS_TO]->(h);

// Pertenencia pasada a casas (characters_previous_houses.csv)
LOAD CSV WITH HEADERS FROM 'file:///characters_previous_houses.csv' AS row
MATCH (c:Character {link: row.character})
MATCH (h:House {link: row.house})
MERGE (c)-[:PREVIOUSLY_BELONGED_TO]->(h);

// Lealtades y alianzas (allegiances.csv)
LOAD CSV WITH HEADERS FROM 'file:///allegiances.csv' AS row
MATCH (c:Character {link: row.character})
MERGE (h:House {link: row.houseLink})
  ON CREATE SET h.name = row.houseName
MERGE (c)-[:ALLEGIANCE_TO]->(h);

// Aparición de personajes en episodios (characters_episodes.csv)
LOAD CSV WITH HEADERS FROM 'file:///characters_episodes.csv' AS row
MATCH (c:Character {link: row.character})
MATCH (e:Episode {id: toInteger(row.episodeId)})
MERGE (c)-[:APPEARS_IN]->(e);

LOAD CSV WITH HEADERS FROM 'file:///family_ties.csv' AS row
MATCH (child:Character {link: row.character1})
MATCH (parent:Character {link: row.character2})
MERGE (parent)-[r:PARENT_OF]->(child)
SET r.relationship = row.relationship,
    r.type = row.type;

// Locaciones mostradas en episodios (locations.csv)
LOAD CSV WITH HEADERS FROM 'file:///locations.csv' AS row
MATCH (e:Episode {id: toInteger(row.episodeId)})
MATCH (l:Location {id: row.locationId})
MERGE (e)-[r:FEATURED_IN]->(l)
ON CREATE SET r.actors = CASE 
    WHEN row.actor IS NOT NULL AND trim(row.actor) <> '' THEN [row.actor] 
    ELSE [] 
END
ON MATCH SET r.actors = CASE 
    WHEN row.actor IS NOT NULL AND trim(row.actor) <> '' AND NOT row.actor IN r.actors 
    THEN r.actors + row.actor 
    ELSE r.actors 
END;