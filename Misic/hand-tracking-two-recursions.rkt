#lang racket

( require racket/trace )

( define ( sequence name n )
   ( cond
      ( ( = n 1 )
        ( display ( name 1 ) ) ( display " " )
        )
      ( else
        ( sequence name ( - n 1 ) )
        ( display ( name n ) ) ( display " " )
        )
      )
   )

( define ( sequence2 name n )
   ( cond
      ( ( = n 1 )
        ( display ( name 1 ) ) ( display " " )
        )
      ( else
        ( display ( name n ) ) ( display " " )
        ( sequence name ( - n 1 ) )
        )
      )
   )

(define (square n)(* n n))

( trace sequence2 )
