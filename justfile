ROBOT := "java -Xmx12G -jar downloads/robot.jar"

download:
    mkdir -p downloads
    wget -O downloads/fma.owl http://purl.org/sig/ont/fma.owl

setup-robot:
    mkdir -p downloads
    wget -O downloads/robot.jar https://github.com/ontodev/robot/releases/download/v1.9.6/robot.jar

subset-ontology:
    mkdir -p output
    {{ROBOT}} remove --input downloads/fma.owl \
      --axioms disjoint \
      --output output/fma-fixed.owl

reason:
    {{ROBOT}} reason --reasoner ELK --input output/fma-fixed.owl

all: download setup-robot subset-ontology reason
