=====
My CV
=====

PDF CV in LaTeX (``latex`` branch); the online version is the ``html``
branch, published at https://adrienlemaire.github.io/cv/.


Requirements
------------

The LaTeX toolchain is provided by the Nix flake::

    $ nix develop

or automatically with direnv (``direnv allow``).


How to build
------------
::

    $ cd 2026/cto && make force
    $ make ats
