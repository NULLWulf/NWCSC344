#lang racket

( require racket/trace )

( define ( list->set l )
   ( cond
      ( ( empty? l ) '() )
      ( ( member ( car l ) ( cdr l ) ) ( list->set ( cdr l ) ) )
      ( else ( cons ( car l ) ( list->set ( cdr l ) ) ) )
      )
   )

( define ( listset l )
   ( cond
      ( ( empty? l ) '() )
      ( ( member ( car l ) ( cdr l ) ) ( listset ( cdr l ) ) )
      ( else ( cons ( car l ) ( listset ( cdr l ) ) ) )
      )
   )
;( trace list->set )