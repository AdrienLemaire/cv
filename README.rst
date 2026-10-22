=====
My CV
=====


Requirements
------------

The LaTeX toolchain (xelatex, cv4tw, fontawesome, libertine) is provided by
the Nix flake::

    $ nix develop

or automatically with direnv (``direnv allow``). Verified with the 2018
xelatex builds; the 2011 - 2015 pdflatex builds are not covered.


How to build CV
---------------

2011 - 2015::

    $ pdflatex -shell-escape file.tex

2015 + ::

    $ make clean all

How to build Cover letter
-------------------------
::

    $ pdflatex -shell-escape file.tex


Customization
-------------

https://github.com/Cicatrice/cv4tw/blob/master/CUSTOMIZE.md
