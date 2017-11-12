PROCESS=process.py
PYTHON=python3
EXEC=$(PYTHON) $(PROCESS)
REG=$(PYTHON) region.py
CONF=configuration/
GEN=generated/

all: occitanie

france-region:
	$(REG) -c $(GEN)occitanie/occitanie.json \
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

