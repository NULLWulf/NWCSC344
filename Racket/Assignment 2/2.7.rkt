#lang racket
(require 2htdp/image)
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ))
( define ( rgb-value ) ( random 256 ) )

( define ( create-star points radius )
   ( radial-star points (/ radius 2) radius "solid" ( random-color)))

( define ( generate-stars points radius )
   ( cond
     [( eq? radius 0)(create-star points radius)]
     [else ( overlay
           ( generate-stars points ( - radius 100 ))( create-star points radius))]))