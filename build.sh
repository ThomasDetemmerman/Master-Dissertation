
# init build
xelatex -shell-escape main

# build bibtex
makeglossaries main

# build bibliography (requires a main.aux which is produced in stap 1)
bibtex main

# build again
xelatex -shell-escape main

# just to be sure
xelatex -shell-escape main

# clean
declare -a artefacts=("aux" "log" "lol" "out" "lof" "lot" "toc" "acn" "acr" "alg" "glg" "glo" "gls" "glsdefs" "ist" "bbl" "bcf" "blg" "run.xml")
IFS='
'
for artefact in "${artefacts[@]}"; do
    for x in `find . -name "*.${artefact}"`; do rm -r $x; done
done;

# Open pdf
open main.pdf