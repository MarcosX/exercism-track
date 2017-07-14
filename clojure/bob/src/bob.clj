(ns bob)

(defn response-for [phrase]
  (if (= (clojure.string/trim phrase) "")
    "Fine. Be that way!"
    (if (re-matches #"^(\d|,|\s)+$" phrase)
      "Whatever."
    (if (= phrase (clojure.string/upper-case phrase))
      (if (re-matches #"^(\d.*)\?$" phrase)
        "Sure."
        "Whoa, chill out!")
      (if (clojure.string/ends-with? phrase "?")
        "Sure."
        "Whatever."))))
)
