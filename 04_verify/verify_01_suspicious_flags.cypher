// Verify Listing 2: flags on event edges
MATCH (:Account {id:'A1'})-[t:TRANSFER]->(:Account {id:'B7'})
RETURN t.txId AS txId, t.amount AS amount, t.currency AS currency, t.flags AS flags
ORDER BY txId;
