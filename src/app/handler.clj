(ns app.handler
  (:require [clojure.data.json :as json]
            [clojure.walk :as walk])
  (:gen-class))

(defn parse [data]
  (-> data
      json/read-str
      walk/keywordize-keys))

(defn body [data]
  (-> data
      parse
      :message
      (or "No message, I'm afraid ...")))

(defn handle-request [args]
  (-> args
      first
      body
      json/write-str))

(defn -main [& args]
  (-> args
      handle-request
      println))

(comment
  (-> '("{\"hello\":\"world\",\"message\":\"this is the message\"}")
      handle-request))
