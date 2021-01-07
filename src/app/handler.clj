(ns app.handler
  (:gen-class
   :methods [^:static [handler [String] String]]))

(defn -handler [s]
  (println "Hello world from handler"))
