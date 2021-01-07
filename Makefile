.PHONY: uberjar run

JAR_NAME := app-core-lambda.jar

clean:
	rm -rf classes
	rm -rf target

setup:
	mkdir classes

compile:
	clj -A:compile

uberjar: clean setup compile
	clojure -A:uberjar --target target/${JAR_NAME} --main-class app.core

run:
	java -jar target/${JAR_NAME}
