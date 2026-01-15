// Listing 2 — RULE suspicious_transfer MODE LOG (fixpoint-style batching via apoc.periodic.commit)
CALL apoc.periodic.commit(
"
MATCH (a:Account)-[t:TRANSFER]->(b:Account)
WHERE t.currency = 'EUR' AND t.amount > 10000

MERGE (a)-[s:SUSPICIOUS_TRANSFER]->(b)
ON CREATE SET s._inferred = true, s._rule = 'suspicious_transfer'

// ENRICH (add-only, set semantics)
SET t.flags = apoc.coll.toSet(coalesce(t.flags, []) + ['SUSPICIOUS'])

WITH t LIMIT $limit
RETURN count(*) AS updates
",
{limit: 5000}
);
