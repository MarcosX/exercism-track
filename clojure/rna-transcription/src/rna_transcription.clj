(ns rna-transcription)

(def rna-map {\G \C
              \C \G
              \T \A
              \A \U})

(defn to-rna [rna-strand]
  (reduce (fn [strand nucleotide]
            (if (contains? rna-map nucleotide)
              (str strand (get rna-map nucleotide))
              (throw (AssertionError. (str "Invalid nucleotide " nucleotide)))))
          ""
          rna-strand))
