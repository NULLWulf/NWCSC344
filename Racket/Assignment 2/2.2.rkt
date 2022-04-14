#lang racket
(define (roll-die) (random 1 6))

(define (roll-for-1)
  ( define outcome ( roll-die ) )
  ( cond
     ( ( = outcome 1) (display outcome) ( display " " ) )
     ( (display outcome) (display " ") (roll-for-1))))

(define (roll-for-11)
  ( roll-for-1 )
  ( define outcome ( roll-die ) )
  ( display outcome ) ( display " " )
  ( cond
     ( ( not ( eq? outcome 1 ) ) ( roll-for-11 ))))

(define (roll-for-odd-even-odd)
  (define outcome ( roll-die))
  (display (format "~a " outcome) )
  (cond
    [(even? outcome)(roll-for-odd-even-odd)]
    [(odd? outcome)     ; else is odd
     (define outcome (roll-die))
     (display (format "~a " outcome) )
     (cond
       [(odd? outcome)(roll-for-odd-even-odd)]
       [(even? outcome)  ;; else is even
        (define outcome (roll-die))
        (display (format "~a " outcome) )
        (cond 
          [(even? outcome)(roll-for-odd-even-odd)])])]))   

( define ( roll-two-dice-for-a-lucky-pair )
   ( define roll-1 ( roll-die ) )
   ( define roll-2 ( roll-die ) )
   ( define sum ( + roll-1 roll-2 ) )
   ( display (format "(~a,~a)" roll-1 roll-2))
   ( cond
      [( = sum 7 ) (display " Rolled a lucky 7! ")]
      [( = sum 11) (display " Rolled a Lucky 11! ")]
      [( = roll-1 roll-2)(display " Rolled a Double! ")]
      [else ( display " ")( roll-two-dice-for-a-lucky-pair)]))

(define (roll-for-odd)
  ( define outcome ( roll-die ) )
  ( cond
     ( ( odd? outcome) (display outcome) ( display " " ) )
     ( (display outcome) (display " ") (roll-for-odd))))

(define (roll-for-even)
  ( define outcome ( roll-die ) )
  ( cond
     ( ( even? outcome) (display outcome) ( display " " ) )
     ( (display outcome) (display " ") (roll-for-even))))