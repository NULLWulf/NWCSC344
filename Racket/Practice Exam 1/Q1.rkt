#lang racket

;;; Question 1

( require 2htdp/image )

( define ( tile side circle-color background-color )
   ( define sq ( square side "solid" background-color ) )
   ( define circ ( circle ( / side 3 ) "solid" circle-color ) )
   ( overlay circ sq ))

;;; Question 2

