// Verify Listing 7: evidence on descendedFrom
MATCH ()-[e:descendedFrom]->()
RETURN e._rule AS rule, e.evidence AS evidence
LIMIT 50;
