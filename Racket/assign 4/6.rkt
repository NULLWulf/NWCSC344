#lang racket

( require 2htdp/image )

( define ( roll-die ) ( + ( random 6 ) 1 ) )

( define ( dot )
   ( circle ( + 10 ( random 41 ) ) "solid" ( random-color ) )
   )

( define ( big-dot )
   ( circle ( + 10 ( random 141 ) ) "solid" ( random-color ) )
   )

( define ( random-color )
   ( color ( random 256 ) ( random 256 ) ( random 256 ) )
   )

( define ( sort-dots loc )
   ( sort loc #:key image-width < )
   )

( define ( generate-list n o )
   ( cond
      ( ( eq? n 0 ) '() )
      ( else
        ( cons ( o ) ( generate-list ( - n 1 ) o ) )
        )
      )
   )

