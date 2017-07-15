(ns rna-transcription)

(def rna-map {\G \C
              \C \G
              \T \A
              \A \U})

(defn reduce-nucleotide [strand nucleotide]
  (if (contains? rna-map nucleotide)
    (str strand (get rna-map nucleotide))
    (throw (AssertionError. (str "Invalid nucleotide " nucleotide)))))

(defn to-rna [rna-strand]
  (reduce reduce-nucleotide "" rna-strand))
