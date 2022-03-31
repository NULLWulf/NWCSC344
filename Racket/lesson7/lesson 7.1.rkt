#lang racket

( require racket/trace )


;;;;;;;;;;;;;;; RAC
( define ( rac l )
   ( cond
      ( ( = ( length l ) 1 ) ( car l ) )
      ( else ( rac ( cdr l ) ) )
      )
   )

( trace rac )

;;;;;;;;;;;;;: RDC

( define ( rdc l )
   ( cond
      ( ( empty? ( cdr l ) ) '() )
      ( else ( cons ( car l ) ( rdc ( cdr l ) ) ) )
      )
   )

( trace rdc )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( define ( palindrome? l )
( cond
( ( empty? l ) #t )
( ( empty? ( cdr l ) ) #t )
( ( equal? ( car l ) ( rac l ) )
( palindrome? ( cdr ( rdc l ) ) )
)
( else
#f
)
)
)

( trace palindrome?)
