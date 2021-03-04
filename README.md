### Clojure Lambda Experiments

Experimenting with `AWS Lambda` and `Clojure`.

* Ahead of time compilation (AOT) :heavy_check_mark:
* Build an Uberjar :heavy_check_mark:
* Build a native image with GraalVM :heavy_check_mark:
* Run the compiled code in Docker (Work in progress) :boom:

#### Notes
I downloaded GraalVM, extracted the downloaded file and ran a virus scan (ClamTK). The scanner found a potential threat, that confused me:
a Node.js npm package called `imurmurhash.min.js`. ClamTK status for this file was: `PUA.Win.Trojan.Xored-1`.

My quick fix for this was to navigate to the `graalvm-ce-java11-21.0.0.2/languages` folder and delete the entire `js` folder before running any GraalVM commands.

TODO: Why was this file flagged by the virus scanner?

#### Resources
* [A GraalVM guide](https://github.com/BrunoBonacci/graalvm-clojure/blob/master/doc/clojure-graalvm-native-binary.md) by Bruno Bonacci
* [Building A Fast Command Line App With Clojure](https://kiramclean.com/blog/building-a-fast-command-line-app-with-clojure/) by Kira McLean
* [How to AOT compile a Clojure application to a native binary and run it in AWS Lambda as a Docker image.](https://nitor.com/en/articles/fast-cold-starts-for-clojure-in-aws-lambda-using-graalvm-native-image) by Esko Luontola
