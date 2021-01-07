(ns app.handler
  (:require [clojure.java.io :as io]
            [clojure.data.json :as json]
            [clojure.walk :as walk])
  (:gen-class
   :implements [com.amazonaws.services.lambda.runtime.RequestStreamHandler]))

(defn handler [data]
 (-> data
     walk/keywordize-keys
     :message
     (or "No message, I'm afraid ...")))

(defn -handleRequest [_this input output _context]
  (with-open [reader (io/reader input)
              writer (io/writer output)]
    (-> reader
        (json/read)
        handler
        (json/write writer))))
