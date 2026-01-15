// Seed data for Listing 2–4 (accounts + transfers, including multi-edge)

MERGE (a1:Account {id:'A1'})
MERGE (b7:Account {id:'B7'})
MERGE (c9:Account {id:'C9'});

// Two parallel transfers A1 -> B7 (multi-edge), distinct txId
CREATE (a1)-[:TRANSFER {txId:'TX-991', currency:'EUR', amount:12000}]->(b7);
CREATE (a1)-[:TRANSFER {txId:'TX-992', currency:'EUR', amount:500}]->(b7);

// Another transfer
CREATE (b7)-[:TRANSFER {txId:'TX-993', currency:'USD', amount:20000}]->(c9);
