.PHONY: clean setup compile native build package-runtime package-function package

TARGET := ./target/lambda-experiment
BOOTSTRAP := ./runtime/bootstrap
MAIN := app.main

clean:
	rm -rf classes
	rm -rf target
	rm -rf package

setup: clean
	mkdir classes
	mkdir target
	mkdir package

compile: setup
	clojure -M -e "(compile '${MAIN})"

native: compile
	native-image \
                     -cp "$(shell clojure -Spath):classes" \
                     -H:+ReportExceptionStackTraces \
                     --initialize-at-build-time \
                     --verbose \
                     --no-fallback \
                     --no-server \
                     "-J-Xmx3g" \
                     -H:Name=${TARGET} \
                     ${MAIN}

build: native
	chmod 755 ${TARGET} ${BOOTSTRAP}

package-function: build
	cp target/lambda-experiment package/lambda-experiment
	(cd package && \
         zip function.zip lambda-experiment)

package-runtime:
	cp runtime/bootstrap package/bootstrap
	(cd package && \
         zip runtime.zip bootstrap)

package: build package-function package-runtime
