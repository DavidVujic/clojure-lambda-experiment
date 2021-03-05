.PHONY: clean setup compile uberjar run

TARGET_FOLDER := ./target
JAR_NAME := lambda-experiment.jar
NATIVE_NAME := graal-${JAR_NAME}
JAR_PATH := ${TARGET_FOLDER}/${JAR_NAME}
TARGET_PATH := ${TARGET_FOLDER}/${NATIVE_NAME}

clean:
	rm -rf classes
	rm -rf target

setup:
	mkdir classes

compile:
	clj -M:compile

uberjar: clean setup compile
	clj -M:uberjar --target ${JAR_PATH} --main-class app.handler

graal: uberjar
	native-image --report-unsupported-elements-at-runtime \
                     --initialize-at-build-time \
                     --no-fallback \
                     -jar ${JAR_PATH} \
                     -H:Name=${TARGET_PATH}

run:
	@java -jar ${JAR_PATH}

run-graaled:
	@${TARGET_PATH}
