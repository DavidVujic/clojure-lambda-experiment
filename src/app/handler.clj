(ns app.handler
  (:gen-class
   :methods [^:static [handler [String] String]]))

(defn -handler [s]
  (println "Invoking handler. Input argument is" s)
  (str "Hello world from handler: " s))
