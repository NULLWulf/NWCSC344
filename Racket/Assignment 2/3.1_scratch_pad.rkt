#lang racket

; Increment List
( ( λ ( x )
       ( cons x
       ( cons (+ x 1)
       ( cons (+ x 2)
              '())))) 5 )
; Output : '(5 6 7)

; Reverse List colors
( ( λ ( x y z )
     (list z y x) )
  'red 'yellow 'blue)   ;; Closing After Arguments

; Output : '(blue yellow red)

; Reverse List Numbers
( ( λ ( x y z )
     (list z y x) )
  10 20 30)

; Reverse List String

( ( λ ( x y z )
     (list z y x) )
  "Professor Plum" "Colonel Mustard" "Miss Scarlet" )


( ( λ ( a b)
     ( define L ( list a b ))
     ( define r ( random 1 2))
     ( display (list-ref L 0 ))
     ( display (list-ref L 1 ))
     ( display r)
     ) 3 5)
