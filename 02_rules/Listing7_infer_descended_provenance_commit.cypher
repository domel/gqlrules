// Listing 7 — RULE infer_descended_provenance MODE LOG (monotone evidence accumulation)
CALL apoc.periodic.commit(
"
MATCH ()-[e:descendedFrom]->()
SET e.evidence = apoc.coll.toSet(coalesce(e.evidence, []) + ['rule:descended'])

WITH e LIMIT $limit
RETURN count(*) AS updates
",
{limit: 5000}
);
