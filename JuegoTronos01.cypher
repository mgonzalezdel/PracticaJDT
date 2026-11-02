CREATE CONSTRAINT unique_character_link IF NOT EXISTS
FOR (c:Character) REQUIRE c.link IS UNIQUE;

CREATE CONSTRAINT unique_house_link IF NOT EXISTS
FOR (h:House) REQUIRE h.link IS UNIQUE;

CREATE CONSTRAINT unique_episode_id IF NOT EXISTS
FOR (e:Episode) REQUIRE e.id IS UNIQUE;

CREATE CONSTRAINT unique_location_id IF NOT EXISTS
FOR (l:Location) REQUIRE l.id IS UNIQUE;