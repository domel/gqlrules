// Listing 5 — RULE default_fullname MODE LOG (defaulting via NOT EXISTS)
CALL apoc.periodic.commit(
"
MATCH (p:Person)
WHERE NOT EXISTS { MATCH (p) WHERE p.fullName IS NOT NULL }
SET p.fullName_auto = coalesce(p.fullName_auto, 'Unknown')

WITH p LIMIT $limit
RETURN count(*) AS updates
",
{limit: 5000}
);
