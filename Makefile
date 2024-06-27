.PHONY: set u d b ps web rspec

#setupだと、upとpsが同時に実行される
set: ps u
d:
	docker compose down
u:
	docker compose up
ps:
	docker compose ps
web:
	docker compose exec web bash

rspec:
	docker compose exec web bundle exec rspec