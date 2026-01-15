// Neo4j 5 + APOC PoC — constraints (clean txId as scalar, unique)
// Run this if your data guarantees txId is scalar and you want uniqueness.

CREATE CONSTRAINT account_id_unique IF NOT EXISTS
FOR (a:Account) REQUIRE a.id IS UNIQUE;

// Relationship property uniqueness (Neo4j 5)
CREATE CONSTRAINT transfer_txid_unique IF NOT EXISTS
FOR ()-[t:TRANSFER]-() REQUIRE t.txId IS UNIQUE;
