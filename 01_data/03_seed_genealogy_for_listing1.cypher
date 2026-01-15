// Seed data for Listing 1 (running example) to enable Listing 7 (provenance on descendedFrom)

CREATE (:Person {pid:'X'});
CREATE (:Person {pid:'Y'});
CREATE (:Person {pid:'Z'});

MATCH (y:Person {pid:'Y'}), (x:Person {pid:'X'})
CREATE (y)-[:fatherOf]->(x);

MATCH (z:Person {pid:'Z'}), (y:Person {pid:'Y'})
CREATE (z)-[:motherOf]->(y);
