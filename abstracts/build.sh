
# init build
xelatex -shell-escape extendedabstract


# build again
xelatex -shell-escape extendedabstract


# clean
declare -a artefacts=("aux" "log" "lol" "out" "lof" "lot" "toc" "acn" "acr" "alg" "glg" "glo" "gls" "glsdefs" "ist" "bbl" "bcf" "blg" "run.xml")
IFS='
'
for artefact in "${artefacts[@]}"; do
    for x in `find . -name "*.${artefact}"`; do rm -r $x; done
done;
