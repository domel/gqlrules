// Verify Listing 5–6: defaults + view
MATCH (p:Person)
RETURN p.pid AS pid, p.fullName AS fullName_raw, p.fullName_auto AS fullName_auto,
       coalesce(p.fullName, p.fullName_auto) AS fullName_view
ORDER BY pid;
