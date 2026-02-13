## Remove SubClassOf axioms where the superclass is an existential restriction
## (owl:someValuesFrom) whose filler is a subclass of Deprecated term (fma274321).
## 21 deprecated terms are referenced in 62 such axioms, and since Deprecated term
## is disjoint with Anatomical entity, these restrictions are unsatisfiable.
## This fixes Root Cause 2 (deprecated terms referenced in active axioms).

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX fma: <http://purl.org/sig/ont/fma/>

DELETE {
  ?class rdfs:subClassOf ?restriction .
  ?restriction rdf:type owl:Restriction .
  ?restriction owl:onProperty ?prop .
  ?restriction owl:someValuesFrom ?dep .
}
WHERE {
  ?dep rdfs:subClassOf+ fma:fma274321 .
  ?restriction rdf:type owl:Restriction .
  ?restriction owl:someValuesFrom ?dep .
  ?restriction owl:onProperty ?prop .
  ?class rdfs:subClassOf ?restriction .
}
