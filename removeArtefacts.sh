
declare -a artefacts=("aux" "log" "lol" "out" "lof" "lot")
IFS='
'
for artefact in "${artefacts[@]}"; do
    for x in `find . -name "*.${artefact}"`; do rm -r $x; done
done;