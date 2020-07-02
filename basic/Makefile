REPO=$(shell basename $(CURDIR))

create-env:
	python3 -m venv .$(REPO);
	source .$(REPO)/bin/activate; \
			pip3 install --upgrade -r requirements.txt; \
			python -m ipykernel install --user --name=$(REPO);

update-env:
	source .$(REPO)/bin/activate; \
	pip3 install --upgrade -r requirements.txt;