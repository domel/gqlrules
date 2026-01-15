// Listing 6 — VIEW person_name (PoC: canonical query)
MATCH (p:Person)
RETURN p.pid AS pid,
       coalesce(p.fullName, p.fullName_auto) AS fullName;
