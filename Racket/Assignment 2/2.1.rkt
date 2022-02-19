#lang racket

(define (bake flavor)
  (printf "preheating over...\n")
  (string-append flavor " pie"))

(define (double v)
  ((if (string? v) string-append +) v v))
