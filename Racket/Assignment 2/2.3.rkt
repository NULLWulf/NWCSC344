#lang racket

(define (square n)(* n n))

(define (cube n)(* n n n))

( define ( sequence name n )
   ( cond
      ( ( = n 1 )
        ( display ( name 1 )) ( display " " ))
      ( else
       ( sequence name ( - n 1 ))
       ( display ( name n )) ( display " " ))))

(define (triangular n)
  (cond
    ((= n 1)1)
    (else (+ (triangular (- n 1)) n))))

(define (sigma n)
  (sigrun n n))

(define (sigrun m n)
  (cond
    ((= n 1) 1)
    (else
     (cond
       ((= (remainder m n) 0 )
        (+ (sigrun m (- n 1 )) n ))
       (else(sigrun m (- n 1)))))))
 
    