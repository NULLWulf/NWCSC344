#lang racket

( require racket/trace )


;;;;;;;;;;;;;;; RAC
( define ( rac l )
   ( cond
      ( ( = ( length l ) 1 ) ( car l ) )
      ( else ( rac ( cdr l ) ) )
      )
   )

;( trace rac )

;;;;;;;;;;;;;: RDC

( define ( rdc l )
   ( cond
      ( ( empty? ( cdr l ) ) '() )
      ( else ( cons ( car l ) ( rdc ( cdr l ) ) ) )
      )
   )

;( trace rdc )

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


( define ( snog obj lst )
   ( cond
      ( ( empty? lst )
        ( list obj )
        )
      ( else
        ( cons ( car lst ) ( snog obj ( cdr lst )  ) )
        )
      )
   )

;( trace snog )

;;;;; Sum

( define ( sum n1 )
   ( cond
      ( ( empty? n1 ) 0 )
      ( else
        ( + ( car n1 ) ( sum ( cdr n1 ) ) )
        )))

( trace sum )

( define ( iota n )
     ( cond
        ( ( = n 1 ) '( 1 ) )
        ( else
          ( snog n ( iota ( - n 1 ) )) )))

;( trace iota )

( define ( take-from o l )
   ( cond
      ( ( empty? l )
        '()
        )
        ( ( equal? ( car l ) o )
          ( take-from o ( cdr l ) )
        )
      ( else
        ( cons ( car l ) ( take-from o ( cdr l ) ) )
        )
      ))
   

( trace take-from)