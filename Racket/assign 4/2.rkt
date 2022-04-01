#lang racket

( require racket/trace )

( define ( list->set l )
   ( cond
      ( ( empty? l ) '() )
      ( ( member ( car l ) ( cdr l ) ) ( list->set ( cdr l ) ) )
      ( else ( cons ( car l ) ( list->set ( cdr l ) ) ) )
      )
   )

;( trace list->set )