(ns app.main
  (:require [app.handler :as handler])
  (:gen-class))

(defn -main [& args]
  (try
    (-> args
        handler/handle-request
        println)
    (catch Exception e
      (println "caught exception: " (.getMessage e)))))
