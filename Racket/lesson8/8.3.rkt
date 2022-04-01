#lang racket


( define ( sum nl )
   ( cond
      ( ( empty? nl ) 0 )
      ( else
        ( + ( car nl ) ( sum ( cdr nl ) ) )
        )
      )
   )

( define ( product nl )
   ( cond
      ( ( empty? nl ) 1 )
      ( else
        ( * ( car nl ) ( product ( cdr nl ) ) )
        )
      )
   )