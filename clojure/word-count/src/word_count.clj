(ns word-count)

(defn reduce-word-counter [word-counter word]
  (if (contains? word-counter word)
    (into word-counter {word (+ (get word-counter word) 1)})
    (into word-counter {word 1})))

(defn lower-case-words [word]
  (clojure.string/lower-case word))

(defn clear-non-letters [phrase]
  (clojure.string/replace phrase #"[^a-z|A-Z|\s|0-9]" ""))

(defn split-words [phrase]
  (clojure.string/split phrase #"\s+"))

(defn word-count [phrase]
  (let [only-letters-phrase (clear-non-letters phrase)]
    (reduce reduce-word-counter
            {}
            (map lower-case-words (split-words only-letters-phrase)))))
