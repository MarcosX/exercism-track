(ns bob)

(defn nothing? [phrase]
  (= (clojure.string/trim phrase) "")
)

(defn nonsense? [phrase]
  (re-matches #"^(\d|,|\s)+$" phrase)
)

(defn forceful? [phrase]
  (= phrase (clojure.string/upper-case phrase))
)

(defn forceful-question? [phrase]
  (re-matches #"^(\d.*)\?$" phrase)
)

(defn question? [phrase]
  (clojure.string/ends-with? phrase "?")
)

(defn response-for [phrase]
  (if (nothing? phrase)
    "Fine. Be that way!"
    (if (nonsense? phrase)
      "Whatever."
    (if (forceful? phrase)
      (if (forceful-question? phrase)
        "Sure."
        "Whoa, chill out!")
      (if (question? phrase)
        "Sure."
        "Whatever."))))
)
