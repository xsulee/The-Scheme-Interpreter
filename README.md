# The-Scheme-Interpreter
Fourth project for UC Berkeley's CS61A course. A Scheme interpreter using Python

In this project, I developed an interpreter for a subset of the Scheme language. The subset of the language used in this project is described in the functional programming section of Composing Programs. Since it is only a subset of the language, the interpreter will not exactly match the behavior of other interpreters.

his project includes several files, but all of my changes were made to the first four: scheme.py, scheme_reader.py, questions.scm, and tests.scm. My changes begin with: #BEGIN Problem XX; and end with: #END Problem XX.

Included files:
    scheme.py: the Scheme evaluator
    scheme_reader.py: the Scheme syntactic analyzer
    questions.scm: a collection of functions written in Scheme
    tests.scm: a collection of test cases written in Scheme
    scheme_tokens.py: a tokenizer for Scheme
    scheme_primitives.py: definitions for primitive Scheme procedures
    buffer.py: a Buffer implementation, used in scheme_reader.py
    ucb.py: utility functions for 61A
    ok: the autograder
    tests: a directory of tests used by ok
    mytests.rst: A space for you to add your custom tests in Python; see section on adding your own tests
