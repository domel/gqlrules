// Listing 1 — RULE childOf_from_father
MATCH (y)-[:fatherOf]->(x)
MERGE (x)-[r:childOf]->(y)
ON CREATE SET r._inferred = true, r._rule = 'childOf_from_father';
