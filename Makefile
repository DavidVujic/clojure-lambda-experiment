.PHONY: clean setup compile uberjar run

JAR_NAME := lambda-experiment.jar

clean:
	rm -rf classes
	rm -rf target

setup:
	mkdir classes

compile:
	clj -M:compile

uberjar: clean setup compile
	clj -M:uberjar --target target/${JAR_NAME} --main-class app.handler

graal: uberjar
	native-image --report-unsupported-elements-at-runtime --initialize-at-build-time --no-server -jar ./target/${JAR_NAME} -H:Name=./target/graal-${JAR_NAME}

run:
	@java -jar target/${JAR_NAME}

run-graaled:
	@./target/graal-${JAR_NAME}
