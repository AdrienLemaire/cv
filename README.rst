=====
My CV
=====


Requirements
------------

The LaTeX toolchain (xelatex, libertine, enumitem; cv4tw and fontawesome for
legacy CVs) is provided by the Nix flake::

    $ nix develop

or automatically with direnv (``direnv allow``). Verified with the 2018
xelatex builds; the 2011 - 2015 pdflatex builds are not covered.


How to build CV
---------------

2011 - 2015::

    $ pdflatex -shell-escape file.tex

2015 + (2026+ uses the single-column template in ``2026/cto``)::

    $ cd 2026/cto && make force

How to build Cover letter
-------------------------
::

    $ pdflatex -shell-escape file.tex


Customization
-------------

Legacy cv4tw CVs (2015 - 2018): https://github.com/Cicatrice/cv4tw/blob/master/CUSTOMIZE.md
