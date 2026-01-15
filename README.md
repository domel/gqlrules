# GQL Rules → Cypher (Neo4j 5 + APOC) — PoC for the “Use Cases” Section

This package contains a ready-to-run Proof-of-Concept (PoC) that translates the examples from the **Use Cases** section into a set of **Cypher/APOC** scripts for **Neo4j 5**.  
Files are named after the corresponding listing numbers and can be executed from Neo4j Browser or via `cypher-shell`.

## Requirements

- Neo4j 5.x
- APOC installed and enabled (at minimum: `apoc.periodic.commit`, `apoc.coll.toSet`, `apoc.meta.type`)

## Directory Structure

- `00_ddl/` — constraints (two variants)
- `01_data/` — sample data
- `02_rules/` — rules corresponding to the listings (Cypher/APOC)
- `03_views/` — “VIEW” expressed as a query (Listing 6)
- `04_verify/` — short verification queries

## Quick Start (Recommended Order)

1) (Optional) Clear the database (WARNING: removes EVERYTHING):

   ```cypher
   MATCH (n) DETACH DELETE n;
   ```

2) Choose a constraints variant:

   - **Clean (production):** `00_ddl/00A_constraints_clean.cypher`
     Use this if `t.txId` is a scalar and you want to enforce uniqueness of `txId`.
   - **Dirty-demo:** `00_ddl/00B_constraints_dirty_demo.cypher`
     Use this if you want to demonstrate Listing 4 with `t.txId` stored as a LIST (dirty data).

3) Load the data:

   - `01_data/01_seed_accounts_transfers.cypher`
   - `01_data/02_seed_person_defaults.cypher`
   - `01_data/03_seed_genealogy_for_listing1.cypher`

   If you chose the **Dirty-demo** variant, you may additionally run:
   - `01_data/01_seed_dirty_txid_optional.cypher`

4) Run the rules from the Use Cases section:

   - Listing 2: `02_rules/Listing2_suspicious_transfer_commit.cypher`
   - Listing 3: `02_rules/Listing3_ensure_transfer_metadata.cypher`
   - Listing 4 (diagnostics + MARKED effect):
     - `02_rules/Listing4A_detect_dirty_txid_log_commit.cypher`
     - `02_rules/Listing4B_detect_dirty_txid_marked_commit.cypher`
   - Listing 5: `02_rules/Listing5_default_fullname_commit.cypher`
   - Listing 6 (view as a query): `03_views/Listing6_view_person_name.cypher`

   Listing 7 (provenance) requires the existence of `:descendedFrom` edges.
   If you do not have them in your database yet, run Listing 1 first (running example):

   - `02_rules/Listing1_01_childOf_from_father.cypher`
   - `02_rules/Listing1_02_childOf_from_mother.cypher`
   - `02_rules/Listing1_03_descended_base_commit.cypher`
   - `02_rules/Listing1_04_descended_recursive_commit.cypher`

   Then run:
   - Listing 7: `02_rules/Listing7_infer_descended_provenance_commit.cypher`

5) Verify the results:

   - `04_verify/verify_01_suspicious_flags.cypher`
   - `04_verify/verify_02_suspicious_fact_edge.cypher`
   - `04_verify/verify_03_dirty_diagnostics.cypher`
   - `04_verify/verify_04_person_view.cypher`
   - `04_verify/verify_05_descended_provenance.cypher`

## Implementation Notes (PoC)

- **ENRICH** is implemented as *add-only* over lists with deduplication via `apoc.coll.toSet(...)`.
- Listing 4 (dirty data) is supported in the PoC through the **dirty-demo** variant, where `t.txId` may be a list;
  diagnostics are materialized as `:RuleDiag` nodes.
- `VIEW/EXPOSE` from the PDF is implemented as a canonical view query (Listing 6).

## License

Free to use for research and demonstration purposes.

## DOI



[![DOI](https://zenodo.org/badge/1134913822.svg)](https://doi.org/10.5281/zenodo.18256349)


