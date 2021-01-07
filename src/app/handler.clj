(ns app.handler
  (:gen-class
   :methods [^:static [handler [String] String]]))

(defn -handler []
  (println "Hello world from handler"))
