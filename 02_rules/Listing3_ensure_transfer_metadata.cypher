// Listing 3 — RULE ensure_transfer_metadata MODE LOG
// NOTE: adjust constants (A1,B7,TX-991) as needed.

MATCH (a:Account {id:'A1'}), (b:Account {id:'B7'})
MERGE (a)-[t:TRANSFER {txId:'TX-991'}]->(b)
ON CREATE SET
  t._inferred = true,
  t._rule = 'ensure_transfer_metadata',
  t.createdAt = timestamp()
SET
  t.sources = apoc.coll.toSet(coalesce(t.sources, []) + ['import-2026-01']);
