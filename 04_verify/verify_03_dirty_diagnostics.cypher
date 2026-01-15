// Verify Listing 4: diagnostics
MATCH (d:RuleDiag {code:'BaseFunctionalViolation'})-[:ON_REL]->(t)
RETURN d.rule AS rule, d.key AS key, d.observed AS observed, t.currency AS currency, t.amount AS amount, d.createdAt AS createdAt
ORDER BY createdAt DESC;
