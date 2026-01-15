// Listing 1 — RULE descended_base (fixpoint via apoc.periodic.commit)
CALL apoc.periodic.commit(
"
MATCH (x)-[:childOf]->(y)
WHERE NOT (x)-[:descendedFrom]->(y)
WITH x,y LIMIT $limit
MERGE (x)-[r:descendedFrom]->(y)
ON CREATE SET r._inferred = true, r._rule = 'descended_base'
RETURN count(*) AS updates
",
{limit: 5000}
);
