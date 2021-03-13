.PHONY: clean setup compile native file-access package

TARGET := ./target/lambda-experiment
BOOTSTRAP := ./runtime/bootstrap

clean:
	rm -rf classes
	rm -rf target
	rm -rf package

setup: clean
	mkdir classes
	mkdir target
	mkdir package

compile: setup
	clojure -M -e "(compile 'app.handler)"

native: compile
	native-image \
                     -cp "$(shell clojure -Spath):classes" \
                     -H:Name=${TARGET} \
                     -H:+ReportExceptionStackTraces \
                     --initialize-at-build-time \
                     --verbose \
                     --no-fallback \
                     --no-server \
                     "-J-Xmx3g" \
                     app.handler

file-access:
	chmod 755 ${TARGET} ${BOOTSTRAP}

package: native file-access
	cp target/lambda-experiment package/lambda-experiment
	cp runtime/bootstrap package/bootstrap
	(cd package && \
         zip function.zip bootstrap lambda-experiment)
