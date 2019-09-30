
# init build
xelatex -shell-escape main

# build bibtex
makeglossaries main

# build again
xelatex -shell-escape main

# just to be sure
xelatex -shell-escape main

# clean
declare -a artefacts=("aux" "log" "lol" "out" "lof" "lot" "toc" "acn" "acr" "alg" "glg" "glo" "gls" "glsdef" "ist")
IFS='
'
for artefact in "${artefacts[@]}"; do
    for x in `find . -name "*.${artefact}"`; do rm -r $x; done
done;

# Open pdf
open main.pdf