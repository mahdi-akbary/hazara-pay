NODE = hazara-node
PHP = hazara-php
EXEC = docker exec -it

dev-serve:
	php artisan serve 
	
dev-watch:
	yarn watch

dev-test:
	php bin/phpunit

dev:
	docker compose up --build --remove-orphans

dev-php:
	$(EXEC) $(PHP) /bin/bash
dev-composer-install:
	$(EXEC) $(PHP) composer install

dev-node:
	$(EXEC) $(NODE) /bin/bash
dev-yarn-install:
	$(EXEC) $(NODE) yarn

.PHONY: dev-serve \
		dev-watch \
		dev \
		dev-test \
		dev-php \
		dev-composer-install \
		dev-node \
		dev-yarn-install