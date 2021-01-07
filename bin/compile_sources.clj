(ns compile-sources
  (:require
   [clojure.edn :as edn]
   [clojure.java.io :as io]
   [clojure.string :as str]
   [clojure.tools.namespace.find :as ns.find]))


;; inspired by: https://www.jocas.lt/blog/post/uberdeps-for-aws-lambda/

(defn compile-all []
  (doall
   (->> (slurp "deps.edn")
        (edn/read-string)
        (:paths)
        (map io/file)
        (map ns.find/find-namespaces-in-dir)
        (flatten)
        (map compile)
        (str/join ", ")
        (printf "Compiled: [%s]\n"))))


(defn -main [& args]
  (prn "Starting to AOT compile sources")
  (compile-all)
  (prn "Finished AOT compilation"))
