// Listing 4 — (PoC support) LOG diagnostics for dirty functional key txId
// This detects TRANSFER edges where txId is a LIST with >1 distinct non-null value
// and materializes a diagnostic node :RuleDiag.

CALL apoc.periodic.commit(
"
MATCH ()-[t:TRANSFER]->()
WHERE t.txId IS NOT NULL AND apoc.meta.type(t.txId) = 'LIST'
WITH t, apoc.coll.toSet([x IN t.txId WHERE x IS NOT NULL]) AS vals
WHERE size(vals) > 1

CREATE (d:RuleDiag {
  sev: 'WARN',
  code: 'BaseFunctionalViolation',
  rule: 'detect_dirty_txid',
  msg: 'Edge has multiple distinct non-null txId values; scalar projection undefined.',
  key: 'txId',
  observed: vals,
  createdAt: timestamp()
})
CREATE (d)-[:ON_REL]->(t)

WITH t LIMIT $limit
RETURN count(*) AS updates
",
{limit: 5000}
);
