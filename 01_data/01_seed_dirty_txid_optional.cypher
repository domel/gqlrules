// OPTIONAL: dirty input for Listing 4 (txId as LIST with multiple distinct values)
// Run only with constraints variant 00B (dirty-demo).

MATCH (a:Account {id:'A1'}), (b:Account {id:'B7'})
CREATE (a)-[:TRANSFER {txId:['TX-991','TX-XXX'], currency:'EUR', amount:15000}]->(b);
