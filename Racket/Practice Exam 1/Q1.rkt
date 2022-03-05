#lang racket

;;; Question 1

( require 2htdp/image )

( define ( tile side circle-color background-color )
   ( define sq ( square side "solid" background-color ) )
   ( define circ ( circle ( / side 3 ) "solid" circle-color ) )
   ( overlay circ sq ))

;;; Question 2

( define ( grid grid-side )
   ( define w 'white )( define b 'blue )( define r 'red ) ( define v 'violet )
   ( define tile-size ( / grid-side 3 ))
   ( above ( beside ( tile tile-size r w )( tile tile-size r w )( tile tile-size r w ))
           ( beside ( tile tile-size v w )( tile tile-size v w )( tile tile-size v w ))
           ( beside ( tile tile-size b w )( tile tile-size b w )( tile tile-size b w ))))
