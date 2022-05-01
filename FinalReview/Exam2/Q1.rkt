#lang racket
( define numeric-lists '( ( 3 7 9 ) ( 2 6 4 ) ( 8 7 ) ( 2 4 6 8 ) ( 5 3 1 ) ) )

( define names '("Radiant" "Veil" "Shallan" ) )

( map ( lambda ( x ) ( list x x ) ) ( car numeric-lists ) )

( filter ( λ ( x ) ( odd? ( car x ) ) ) numeric-lists )1

( foldr + 0 ( map ( λ ( x ) ( car ( sort x > ) ) ) numeric-lists ) )