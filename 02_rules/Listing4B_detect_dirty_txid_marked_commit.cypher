// Listing 4 — RULE detect_dirty_txid MODE LOG (operational effect for clean witnesses)
// Only applies when txId is scalar and equals 'TX-991' (adjust as needed).

CALL apoc.periodic.commit(
"
MATCH ()-[t:TRANSFER]->()
WHERE apoc.meta.type(t.txId) <> 'LIST' AND t.txId = 'TX-991'
MERGE (t)-[m:MARKED]->(t)
ON CREATE SET m._inferred = true, m._rule = 'detect_dirty_txid'

WITH t LIMIT $limit
RETURN count(*) AS updates
",
{limit: 5000}
);
