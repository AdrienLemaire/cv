=====
My CV
=====


Requirements
------------

 - texlive-bin
 - texlive-latexextra (contains ecv)
 - texlive-fontsextra (contains ifsym)

cv4tw
-----

 - texlive-bin
 - texlive-latexextra
 - texlive-fontsextra
 - ttf-linux-libertine
 - miktex ?
 - xetex [Can't find it]
 - fontawesome.sty
 


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
