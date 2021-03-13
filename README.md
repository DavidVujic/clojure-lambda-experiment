### Clojure Lambda Experiments

Experimenting with `AWS Lambda` and `Clojure`.

* Ahead of time compilation (AOT) :white_check_mark:
* Build an Uberjar :white_check_mark:
* Build a native image with GraalVM :white_check_mark:
* Run the compiled code in Docker :white_check_mark:
* ~~Push the Docker file to AWS~~ :confused:
* ~~Add a lambda using the Docker container and test if the entry point is correct~~ :confused:
* Create a bash custom runtime for AWS Lambda :white_check_mark:
* Deploy the custom runtime with the Clojure code compiled to a native image :white_check_mark:
* Test the custom runtime locally in Docker, using a Custom Runtime image from AWS :white_check_mark:

#### Resources
* [clj-graal-docs - with an Hello World example](https://github.com/lread/clj-graal-docs/blob/master/doc/hello-world.md)
* [Custom AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-walkthrough.html)
* [Lambda Container Image Support (example with Custom Runtime)](https://aripalo.com/blog/2020/aws-lambda-container-image-support/)
* [A GraalVM guide](https://github.com/BrunoBonacci/graalvm-clojure/blob/master/doc/clojure-graalvm-native-binary.md) by Bruno Bonacci
* [Building A Fast Command Line App With Clojure](https://kiramclean.com/blog/building-a-fast-command-line-app-with-clojure/) by Kira McLean
* [How to AOT compile a Clojure application to a native binary and run it in AWS Lambda as a Docker image.](https://nitor.com/en/articles/fast-cold-starts-for-clojure-in-aws-lambda-using-graalvm-native-image) by Esko Luontola
* [aws-lambda-java at Docker Hub](https://hub.docker.com/r/amazon/aws-lambda-java)
* [GraalVM and Native images](https://www.graalvm.org/docs/getting-started/#native-images)


#### Notes

##### Clojure version
Using Clojure 1.10.2 that has GraalVM specific features/fixes.

##### Deploying to AWS vs testing locally
I found out that, when running the custom runtime locally in Docker with a custom runtime image, the `bootstrap` file
should be copied in a different directory than the function code - not sure how this works when only pushing a `zip` to AWS.

##### GraalVM
I downloaded GraalVM, extracted the downloaded file and ran a virus scan (ClamTK). The scanner found a potential threat, that confused me:
a Node.js npm package called `imurmurhash.min.js`. ClamTK status for this file was: `PUA.Win.Trojan.Xored-1`.

My quick fix for this was to navigate to the `graalvm-ce-java11-21.0.0.2/languages` folder and delete the entire `js` folder before running any GraalVM commands.

Why was this file flagged by the virus scanner?
