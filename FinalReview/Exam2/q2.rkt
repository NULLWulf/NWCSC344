#lang racket

( define ( mono l )
   ( eq? ( sort l > ) l ) )


( define ( last-elemenets o )
   ( map ( λ ( x ) ( car ( reverse x ) ) ) o ) )

( last-elemenets '( ( apple peach ) ( 1 2 3 ) ( one two three four fivee ) ) )

( last-elemenets '( ( 1 two 3 four ) ( red white blue ) ) )