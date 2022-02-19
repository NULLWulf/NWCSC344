#lang racket
(require 2htdp/image)

( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ( rgb-value ) ))
( define ( rgb-value ) ( random 256 ) )


(define ( floor width height color)
  (rectangle width height "solid" color )
  )

(define ( roof width )
  (triangle width "solid" "grey"))

(define (house width height color1 color2 color3)
  (above (roof width) (floor width height color1)(floor width height color2)(floor width height color3)))

(define (divSix num)(/ num 6))

(define color1 (random-color))
(define color2 (random-color))
(define color3 (random-color))

(define (tract width height)
  (beside (house (divSix width) (divSix height) color1 color2 color3)
          (house (divSix width) (divSix height) color2 color1 color3)
          (house (divSix width) (divSix height) color3 color1 color2)
          (house (divSix width) (divSix height) color1 color3 color2)
          (house (divSix width) (divSix height) color2 color3 color1)
          (house (divSix width) (divSix height) color3 color2 color1)
          )
  )