PROCESS=process.py
PYTHON=python3
EXEC=$(PYTHON) $(PROCESS)
REG=$(PYTHON) region.py
CONF=configuration/
GEN=generated/

all: occitanie auvergne-rhone-alpes paca

france-region:
	$(REG) -c $(GEN)occitanie/occitanie.json \
		-c $(GEN)auvergne-rhone-alpes/auvergne-rhone-alpes.json \
		-c $(GEN)paca/paca.json \
		-o $(GEN)$@ \
		-r "France"

# Occitanie
occitanie: toulouse montpellier
	$(REG) -c $(GEN)$@/toulouse.json \
		-c $(GEN)$@/montpellier.json \
		-o $(GEN)$@/$@ \
		-r "Occitanie"

toulouse:
	mkdir -p $(GEN)occitanie
	$(EXEC) $(CONF)occitanie/toulouse.json $(GEN)occitanie/toulouse

montpellier:
	mkdir -p $(GEN)occitanie
	$(EXEC) $(CONF)occitanie/montpellier.json $(GEN)occitanie/montpellier

# Auvergne-Rhône-Alpes
auvergne-rhone-alpes: lyon grenoble
	$(REG) -c $(GEN)$@/lyon.json \
		-c $(GEN)$@/grenoble.json \
		-o $(GEN)$@/$@ \
		-r "Auvergne-Rhône-Alpes"

lyon:
	mkdir -p $(GEN)auvergne-rhone-alpes
	$(EXEC) $(CONF)auvergne-rhone-alpes/lyon.json $(GEN)auvergne-rhone-alpes/lyon

grenoble:
	mkdir -p $(GEN)auvergne-rhone-alpes
	$(EXEC) $(CONF)auvergne-rhone-alpes/grenoble.json $(GEN)auvergne-rhone-alpes/grenoble

# PACA
paca: aix-en-provence marseille nice
	$(REG) -c $(GEN)$@/aix-en-provence.json \
		-c $(GEN)$@/marseille.json \
		-c $(GEN)$@/nice.json \
		-o $(GEN)$@/$@ \
		-r "Provence-Alpes-Côte-d'Azur"

aix-en-provence:
	mkdir -p $(GEN)paca
	$(EXEC) $(CONF)paca/aix-en-provence.json $(GEN)paca/aix-en-provence

marseille:
	mkdir -p $(GEN)paca
	$(EXEC) $(CONF)paca/marseille.json $(GEN)paca/marseille

nice:
	mkdir -p $(GEN)paca
	$(EXEC) $(CONF)paca/nice.json $(GEN)paca/nice

