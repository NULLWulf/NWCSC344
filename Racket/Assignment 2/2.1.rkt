#lang racket
(require 2htdp/image)

( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ))
( define ( rgb-value ) ( random 256 ) )

(define ( floor width height color)
  (rectangle width height "solid" color ))

(define ( roof width )
  (triangle width "solid" "grey"))

(define (house width height color1 color2 color3)
  (above (roof width) (floor width height color1)(floor width height color2)(floor width height color3)))

(define (tract width height)
  (define hw (/ (- width 50) 6))
  (define hh (/ height 3))
  (define box (square 10 0 "white"))
  (define color1 (random-color))
  (define color2 (random-color))
  (define color3 (random-color))
  (beside (house hw hh color1 color2 color3)
          box
          (house hw hh color2 color1 color3)
          box
          (house hw hh color3 color1 color2)
          box
          (house hw hh color1 color3 color2)
          box
          (house hw hh color3 color2 color1)
          box
          (house hw hh color2 color3 color1)))