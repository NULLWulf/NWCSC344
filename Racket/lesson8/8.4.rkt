#lang racket

( require 2htdp/image )


( define ( foldright operator value list )
   ( cond
      ( ( empty? list ) value )
      ( else
        ( operator ( car list ) ( foldright operator value ( cdr list ) ) )
        )
      )
   )


( define ( arrow n c )
   ( define part ( square 50 "solid" c ) )
   ( define head ( rotate 30 ( triangle 70 "solid" c ) ) )
   ( define stem ( foldr beside empty-image ( make-list ( - n 1 ) part ) ) )
   ( beside stem head )
   )