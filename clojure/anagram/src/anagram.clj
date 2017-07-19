(ns anagram)

(defn- sorted-chars [word]
  (apply str (-> word
      clojure.string/lower-case
      sort)))

(defn- is-same-word? [base-word word-to-compare]
  (= (clojure.string/lower-case base-word) (clojure.string/lower-case word-to-compare)))

(defn- is-anagram? [base-word word-to-compare]
  (if (is-same-word? base-word word-to-compare)
    false
    (= (sorted-chars base-word) (sorted-chars word-to-compare))))

(defn anagrams-for [word anagrams]
  (filter #(is-anagram? % word) anagrams)
)
