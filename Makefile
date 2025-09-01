.PHONY: start stop restart logs status ps pull up down

COMPOSE_MAC=compose.webui-mac.yml
COMPOSE_ALL=compose.all-in-one.yml

start:
	@echo "[start] Open WebUI (mac + native Ollama)"
	docker compose -f $(COMPOSE_MAC) up -d
	@echo "[ok] http://localhost:$${WEBUI_PORT:-3000}"

stop:
	@echo "[stop] Containers (mac setup)"
	docker compose -f $(COMPOSE_MAC) down

restart: stop start

logs:
	docker logs -f open-webui

status ps:
	docker ps --format '{{.Names}}\t{{.Image}}\t{{.Ports}}'

pull:
	docker compose -f $(COMPOSE_MAC) pull

up:
	docker compose -f $(COMPOSE_ALL) up -d
	@echo "[ok] All-in-one op http://localhost:$${WEBUI_PORT:-3000}"

down:
	docker compose -f $(COMPOSE_ALL) down

