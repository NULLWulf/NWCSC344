#lang racket

( require 2htdp/image )

( define ( color-thing )
   ( display "(?): " )
   ( define the-list ( read ) )
   ( cond
     [( equal? ( car the-list) 'all )
      ( display-all-bars ( cadr the-list ) ) ]
     {( equal? ( car the-list) 'random )
      ( display-random ( cadr the-list ) ) }
     [else
      (display-one ( car the-list ) ( cadr the-list ) ) ] )
   ( display "\n" )
   ( color-thing ) )

( define ( bar color ) ( display ( rectangle 600 50 "solid" color  ) ) )

( define ( display-all-bars color-list )
   (cond
     [(not ( empty? color-list) )
           ( bar ( car color-list) )
           ( display "\n" )
           ( display-all-bars ( cdr color-list ) ) ] ) )

( define ( display-random color-list )
   ( bar ( list-ref color-list ( random ( length color-list ) ) ) ) )

( define ( display-one choice color-list )
   ( bar ( list-ref color-list ( - choice 1 ) ) ) )

