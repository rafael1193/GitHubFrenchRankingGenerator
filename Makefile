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

occitanie: toulouse
	$(REG) -c $(GEN)$@/toulouse.json \
		-o $(GEN)$@/$@ \
		-r "Occitanie"

toulouse:
	mkdir -p $(GEN)occitanie
	$(EXEC) $(CONF)occitanie/toulouse.json $(GEN)occitanie/toulouse
