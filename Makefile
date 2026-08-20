.DEFAULT_GOAL := help

.PHONY: help install dev build preview type-check lint format check clean distclean

help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

install: ## Installe les dependances (lockfile fige)
	yarn install --frozen-lockfile

dev: ## Lance le serveur de developpement Vite
	yarn dev

build: ## Type-check puis build de production dans dist/
	yarn build

preview: ## Sert le build de production en local
	yarn preview

type-check: ## Verifie les types avec vue-tsc
	yarn type-check

lint: ## Lint et corrige avec ESLint
	yarn lint

format: ## Formate src/ avec Prettier
	yarn format

check: type-check lint ## Verifie types et lint sans rien modifier d'autre

clean: ## Supprime les artefacts de build et les caches de compilation
	rm -rf dist node_modules/.tmp

distclean: clean ## clean + supprime node_modules
	rm -rf node_modules
