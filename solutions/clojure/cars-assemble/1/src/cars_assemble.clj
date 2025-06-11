(ns cars-assemble)

(defn- get-percentage
  "Retrieve the percentage depending on the speed"
  [speed]
  (cond
    (= 0 speed) 0
    (and (>= speed 1) (<= speed 4)) 100
    (and (>= speed 5) (<= speed 8)) 90
    (= 9 speed) 80
    (= 10 speed) 77
    :else 0
    )
  )

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (double (/ (* 221 speed (get-percentage speed)) 100))
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60))
  )

