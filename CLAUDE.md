# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A community effort to produce a satisfiable version of the [FMA](http://si.washington.edu/projects/fma) ontology v5.0.0. Three goals guide all changes:

1. **Satisfiability** — eliminate the 69,151 unsatisfiable classes in the current OWL distribution
2. **Compatibility** — preserve behavior for most existing FMA use cases (though these are largely undefined)
3. **Fidelity** — stay as close as possible to the original intent of the FMA developers (which is not always clear from the OWL encoding alone)

The unsatisfiable classes stem from two root causes:

1. **Contradictory range axioms on `derives_from`** — ranges of both `Developmental structure` (an `Anatomical structure`) and `Set of developmental entities` (an `Anatomical set`), which are declared disjoint
2. **Deprecated terms still referenced in active axioms** — 142 classes under `Deprecated term` (disjoint with `Anatomical entity`) used as fillers in existential restrictions whose property ranges require `Anatomical entity`

These cascade through FMA's dense network of existential restrictions to affect the majority of classes.

Related: [OBOFoundry/OBOFoundry.github.io#21](https://github.com/OBOFoundry/OBOFoundry.github.io/issues/21)

## Setup

```bash
just download    # fetches fma.owl (~254 MB) into downloads/ (gitignored)
```

Load curation skills from: https://github.com/ai4curation/curation-skills

## Working with the Ontology

- The ontology file is `downloads/fma.owl` (OWL/RDF XML format, ~254 MB)
- `unsats-sample.md` contains traced explanations of unsatisfiable classes showing the logical chains back to root causes
- This is an ontology curation project — work involves analyzing and modifying OWL axioms, not traditional software development
- Use ROBOT or OAK tools for ontology manipulation when available
