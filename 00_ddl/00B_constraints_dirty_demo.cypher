// Neo4j 5 + APOC PoC — constraints (dirty-demo)
// Run this variant if you want to demonstrate Listing 4 where t.txId may be a LIST.
// NOTE: Do NOT create a uniqueness constraint on t.txId in this variant.

CREATE CONSTRAINT account_id_unique IF NOT EXISTS
FOR (a:Account) REQUIRE a.id IS UNIQUE;
