#lang racket

( define ( filter-in p l )
   ( cond
      ( ( empty? l )
        '()
        )
      ( ( p ( car l ) )
        ( cons ( car l ) ( filter-in p ( cdr l ) ) )
        )
      ( else
        ( filter-in p ( cdr l ) )
        )
      )
   )

( define numbers '( 1 2 3 4 5 6 7 9 10 ) )

( define colors '("red" "yellow" "blue" "green" "purple" ) )
( define ( filter-out p l )
   ( cond
      ( ( empty? l )
        '()
        )
      ( ( p ( car l ) )
        ( filter-out p ( cdr l ) )
        )
      ( else
        ( cons ( car l ) ( filter-in p ( cdr l ) ) )
        )
      )
   )

( define ( apply-to-all f l )
   ( cond
      ( ( empty? l )
        '()
        )
      ( else
        ( cons ( f ( car l ) ) ( apply-to-all f ( cdr l ) ) )
        )
      )
   )