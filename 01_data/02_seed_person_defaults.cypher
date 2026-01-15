// Seed data for Listing 5–6 (defaulting + view)

CREATE (:Person {pid:'P1', fullName:'Alice'});
CREATE (:Person {pid:'P2'});                 // missing fullName
CREATE (:Person {pid:'P3', fullName:null});  // explicit null
