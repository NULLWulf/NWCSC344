#lang racket

( require racket/trace )

( define ( count o l )
   ( cond
      ( ( empty? l ) 0 )
      ( ( equal? o ( car l ) ) ( + 1 ( count o (cdr l ) ) ) )
      ( else ( count o ( cdr l ) ) )
      )
   )

;( trace count )