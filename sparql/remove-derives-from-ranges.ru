## Remove range axioms on derives_from.
## derives_from has ranges Developmental structure (fma292313) and
## Set of developmental entities (fma299967), which are subclasses of
## disjoint classes (Anatomical structure and Anatomical set), making
## the effective range empty (OWL interprets multiple ranges as intersection).
## This fixes Root Cause 1 (derives_from range conflict).

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX fma: <http://purl.org/sig/ont/fma/>

DELETE {
  fma:derives_from rdfs:range ?range .
}
WHERE {
  fma:derives_from rdfs:range ?range .
}
