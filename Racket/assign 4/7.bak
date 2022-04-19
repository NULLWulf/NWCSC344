#lang racket

( require 2htdp/image )

( define ( diamond )
   ( rotate 45 ( square ( + 20 ( random 381 ) ) "solid" ( random-color ) )
            ))

( define ( random-color )
   ( color ( random 256 ) ( random 256 ) ( random 256 ) )
   )

( define ( sort-diamonds loc )
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

( define ( diamond-design n )
   ( define diamonds ( generate-list n diamond ) )
   ( foldr overlay empty-image ( sort-diamonds diamonds ) )
   )