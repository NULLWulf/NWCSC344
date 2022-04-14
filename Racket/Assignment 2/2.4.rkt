#lang racket
(require 2htdp/image)

( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ))
( define ( rgb-value ) ( random 256 ) )

( define (dot)
   ( define frame (square 50 0 "white"))
   ( define dot-shape (circle 15 "solid" (random-color)))
   ( overlay dot-shape frame)) 

( define ( hirst-square r c )
   ( cond
      [( = c 1 ) (row-of-dots r)]
      [else (above (row-of-dots r) (hirst-square r ( - c 1)))]))
      

( define ( row-of-dots n)
   (cond
     [( = n 1)(dot)]
     [else (beside (dot) (row-of-dots ( - n 1 )))]))

( define ( hirst-dots n )
   ( hirst-square n n ))