build:
	docker build --build-arg BASE_VERSION=0.0.1 --target gui . -t digitalorganic/jodconverter-examples:gui
	docker build --build-arg BASE_VERSION=0.0.1 --target rest . -t digitalorganic/jodconverter-examples:rest

start-gui: stop
	docker run --name jodconverter-gui -m 512m --rm -p 8080:8080 digitalorganic/jodconverter-examples:gui

start-rest: stop
	docker run --name jodconverter-rest -m 512m --rm -p 8080:8080 digitalorganic/jodconverter-examples:rest

stop:
	docker stop --name jodconverter-rest > /dev/null 2>&1 || true
	docker stop --name jodconverter-spring > /dev/null 2>&1 || true
