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
      ( else ( cons ( car 1 ) ( rdc ( cdr 1 ) ) ) )
      )
   )