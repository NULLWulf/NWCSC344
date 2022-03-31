#lang racket
(define (identity my-pair)
  (equal? (cons (car my-pair) (cdr my-pair)) my-pair))

(identity (cons 42 43)) ; #t
(identity (cons "see" "saw")) ; #t
(identity (cons 'this 'that)) ; #t
(identity (cons + -)) ; #t