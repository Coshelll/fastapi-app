# Переменные
REGISTRY = 89.125.17.58:5000
IMAGE = fastapi-test-app
VERSION = 1.0.1

# Логин в registry
login:
	docker login $(REGISTRY) -u admin -p admin123

# Сборка образа
build:
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION) .
	docker tag $(REGISTRY)/$(IMAGE):$(VERSION) $(REGISTRY)/$(IMAGE):latest

# Пуш образа
push:
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY)/$(IMAGE):latest

# Сборка + пуш (основная команда)
bp: login build push

# Очистка локальных образов
clean:
	docker rmi $(REGISTRY)/$(IMAGE):$(VERSION) $(REGISTRY)/$(IMAGE):latest