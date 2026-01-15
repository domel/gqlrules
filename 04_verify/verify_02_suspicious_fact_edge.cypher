// Verify Listing 2: suspicious fact edge
MATCH (a:Account)-[s:SUSPICIOUS_TRANSFER]->(b:Account)
RETURN a.id AS from, b.id AS to, s._inferred AS inferred, s._rule AS rule;
