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

( define ( stem grade )
   ( quotient grade 10 )
   )

( define ( leaf grade )
   ( remainder grade 10 )
   )

( define ( stem-leaf-tree-lf grades )
   ( echo 'grades grades )
   ( define sorted-grades ( sort grades > ) )
   ( echo 'sorted-grades sorted-grades )
   ( define stems ( map stem sorted-grades ) )
   ( echo 'stems stems )
   ( define leaves ( map leaf sorted-grades ) )
   ( echo 'leaves leaves )
   ( define a-list ( map cons stems leaves ) )
   ( echo 'a-list a-list )
   ( define ( branch n ) ( filter ( lambda (x) ( = ( car x ) n ) ) a-list ) )
   ( define branches ( map branch ( list 10 9 8 7 6 5 4 3 2 1 0 ) ) )
   ( echo 'branches branches )
   ( define live-branches
      ( filter ( lambda (l) ( not ( empty? l ) ) ) branches )
      )
   ( echo 'live-branches live-branches )
   ( define ( trim-branch b ) ( map cdr b ) )
   ( define trimmed-live-branches
      ( map list
            ( map caar live-branches )
            ( map trim-branch live-branches )
            )
      )
   ( echo 'trimmed-live-branches trimmed-live-branches )
   trimmed-live-branches
   )

( define ( echo symbol value )
   ( display symbol )
   ( display " --> " )
   ( display value )
   ( display "\n\n" )
   )