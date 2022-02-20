setup-pre-commit:
	pre-commit install

setup-dev: setup-pre-commit
	poetry install
	poetry run webdrivermanager firefox chrome

i18n:
	poetry run pybabel init -l pt_BR en_US -i api/locale/base.pot -d api/locale && poetry run pybabel compile -d api/locale/

lint:
	poetry run flake8 . && poetry run isort . && poetry run black .

test:
	poetry run python -m pytest --junitxml=junit/test-results.xml --cov=api --cov-report=xml --cov-report=html

shell:
	poetry run ./shell.py
