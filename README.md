# FMA Fixed

A community effort to produce a satisfiable version of the [Foundational Model of Anatomy (FMA)](http://si.washington.edu/projects/fma) ontology (v5.0.0).

## Goals

1. **Satisfiability** — eliminate the 69,151 unsatisfiable classes in the current FMA OWL distribution
2. **Compatibility** — preserve behavior for most existing FMA use cases (though these are largely undefined)
3. **Fidelity** — stay as close as possible to the original intent of the FMA developers (which is not always clear from the OWL encoding alone)

## Problem

The FMA OWL distribution has **69,151 unsatisfiable classes** due to two root causes:

1. **Contradictory range axioms on `derives_from`** — it has ranges of both `Developmental structure` (an `Anatomical structure`) and `Set of developmental entities` (an `Anatomical set`), which are declared disjoint.
2. **Deprecated terms still referenced in active axioms** — 142 classes under `Deprecated term` (disjoint with `Anatomical entity`) are still used as fillers in existential restrictions whose property ranges require `Anatomical entity`.

These cascade through FMA's dense network of existential restrictions to affect the majority of classes.

See also: [OBOFoundry/OBOFoundry.github.io#21](https://github.com/OBOFoundry/OBOFoundry.github.io/issues/21)

## Setup

This repo is designed primarily for use with AI coding agents (e.g. [Claude Code](https://claude.ai/claude-code)).

For best results, load the curation skills from:

> <https://github.com/ai4curation/curation-skills>

Download the source ontology:

```
just download
```

This fetches `fma.owl` into `downloads/` (gitignored).
