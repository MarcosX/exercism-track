(ns beer-song)

(def verse-0
  (str "No more bottles of beer on the wall, no more bottles of beer.\n"
       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"))

(def verse-2
  (str "2 bottles of beer on the wall, 2 bottles of beer.\n"
       "Take one down and pass it around, 1 bottle of beer on the wall.\n"))

(def verse-1
  (str "1 bottle of beer on the wall, 1 bottle of beer.\n"
       "Take it down and pass it around, no more bottles of beer on the wall.\n"))

(defn verse-x [verse-number]
  (str verse-number " bottles of beer on the wall, " verse-number " bottles of beer.\n"
       "Take one down and pass it around, " (- verse-number 1) " bottles of beer on the wall.\n"))


(defn- sing-verse [verse]
  (case verse
    0 verse-0
    1 verse-1
    2 verse-2
    (verse-x verse)))

(defn verse [verse]
  (sing-verse verse))

(defn sing
  ([verse-start] (sing verse-start 0))
  ([verse-start verse-end] (reduce 
                             #(clojure.string/join "\n" [%1 (sing-verse %2)])
                             (sing-verse verse-start)
                             (range (- verse-start 1) (- verse-end 1) -1))))

