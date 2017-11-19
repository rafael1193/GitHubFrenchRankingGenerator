PROCESS=process.py
PYTHON=python3
EXEC=$(PYTHON) $(PROCESS)
REG=$(PYTHON) region.py
CONF=configuration/
GEN=generated/

all: france

regions: auvergne-rhone-alpes bourgogne-franche-comte bretagne centre grand-est hauts-de-france ile-de-france normandie nouvelle-aquitaine occitanie paca pays-de-la-loire

france: regions
	$(REG) -c $(GEN)occitanie/occitanie.json \
		-c $(GEN)auvergne-rhone-alpes/auvergne-rhone-alpes.json \
		-c $(GEN)bourgogne-franche-comte/bourgogne-franche-comte.json \
		-c $(GEN)bretagne/bretagne.json \
		-c $(GEN)centre/centre.json \
		-c $(GEN)grand-est/grand-est.json \
		-c $(GEN)hauts-de-france/hauts-de-france.json \
		-c $(GEN)ile-de-france/ile-de-france.json \
		-c $(GEN)normandie/normandie.json \
		-c $(GEN)nouvelle-aquitaine/nouvelle-aquitaine.json \
		-c $(GEN)occitanie/occitanie.json \
		-c $(GEN)paca/paca.json \
		-c $(GEN)pays-de-la-loire/pays-de-la-loire.json \
		-c $(GEN)paca/paca.json \
		-o $(GEN)$@ \
		-r "France"

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

# Bourgonge-Franche-Comté
bourgogne-franche-comte: dijon
	$(REG) -c $(GEN)$@/dijon.json \
		-o $(GEN)$@/$@ \
		-r "Bourgonge-Franche-Comté"

dijon:
	mkdir -p $(GEN)bourgogne-franche-comte
	$(EXEC) $(CONF)bourgogne-franche-comte/dijon.json $(GEN)bourgogne-franche-comte/dijon

# Bretagne
bretagne: brest rennes
	$(REG) -c $(GEN)$@/brest.json \
		-c $(GEN)$@/rennes.json \
		-o $(GEN)$@/$@ \
		-r "Bretagne"

brest:
	mkdir -p $(GEN)bretagne
	$(EXEC) $(CONF)bretagne/brest.json $(GEN)bretagne/brest

rennes:
	mkdir -p $(GEN)bretagne
	$(EXEC) $(CONF)bretagne/rennes.json $(GEN)bretagne/rennes

# Centre
centre: orleans tours
	$(REG) -c $(GEN)$@/orleans.json \
		-c $(GEN)$@/tours.json \
		-o $(GEN)$@/$@ \
		-r "Centre"

orleans:
	mkdir -p $(GEN)centre
	$(EXEC) $(CONF)centre/orleans.json $(GEN)centre/orleans

tours:
	mkdir -p $(GEN)centre
	$(EXEC) $(CONF)centre/tours.json $(GEN)centre/tours

# Grand Est
grand-est: nancy strasbourg
	$(REG) -c $(GEN)$@/nancy.json \
		-c $(GEN)$@/strasbourg.json \
		-o $(GEN)$@/$@ \
		-r "Grand Est"

nancy:
	mkdir -p $(GEN)grand-est
	$(EXEC) $(CONF)grand-est/nancy.json $(GEN)grand-est/nancy

strasbourg:
	mkdir -p $(GEN)grand-est
	$(EXEC) $(CONF)grand-est/strasbourg.json $(GEN)grand-est/strasbourg

# Hauts-de-France
hauts-de-france: lille
	$(REG) -c $(GEN)$@/lille.json \
		-o $(GEN)$@/$@ \
		-r "Hauts-de-France"

lille:
	mkdir -p $(GEN)hauts-de-france
	$(EXEC) $(CONF)hauts-de-france/lille.json $(GEN)hauts-de-france/lille

# Île de France
ile-de-france: paris
	$(REG) -c $(GEN)$@/paris.json \
		-o $(GEN)$@/$@ \
		-r "Île de France"

paris:
	mkdir -p $(GEN)ile-de-france
	$(EXEC) $(CONF)ile-de-france/paris.json $(GEN)ile-de-france/paris

# Normandie
normandie: rouen
	$(REG) -c $(GEN)$@/rouen.json \
		-o $(GEN)$@/$@ \
		-r "Normandie"

rouen:
	mkdir -p $(GEN)normandie
	$(EXEC) $(CONF)normandie/rouen.json $(GEN)normandie/rouen

# Nouvelle Aquitaine
nouvelle-aquitaine: Bordeaux
	$(REG) -c $(GEN)$@/Bordeaux.json \
		-o $(GEN)$@/$@ \
		-r "Nouvelle Aquitaine"

Bordeaux:
	mkdir -p $(GEN)nouvelle-aquitaine
	$(EXEC) $(CONF)nouvelle-aquitaine/Bordeaux.json $(GEN)nouvelle-aquitaine/Bordeaux

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

# Pays de la Loire
pays-de-la-loire: nantes ville2
	$(REG) -c $(GEN)$@/nantes.json \
		-o $(GEN)$@/$@ \
		-r "Pays de la Loire"

nantes:
	mkdir -p $(GEN)pays-de-la-loire
	$(EXEC) $(CONF)pays-de-la-loire/nantes.json $(GEN)pays-de-la-loire/nantes

