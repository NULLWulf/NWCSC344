#lang racket

( define ( generate-grades n )
   ( map random ( make-list n 101 ) )
   )


( define ( stem grade )
   ( quotient grade 10 )
   )


( define ( leaf grade )
   ( remainder grade 10 )
   )


( define ( stem-leaf-tree-lf grades )
   ( echo 'grades grades )
   ( define sorted-grades ( sort grades < ) )
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


( define ( stem-leaf-tree grades )
   ( define sorted-grades ( sort grades > ) )
   ( define stems ( map stem sorted-grades ) )
   ( define leaves ( map leaf sorted-grades ) )
   ( define a-list ( map cons stems leaves ) )
   ( define ( branch n ) ( filter ( lambda (x) ( = ( car x ) n ) ) a-list ) )
   ( define branches ( map branch ( list 10 9 8 7 6 5 4 3 2 1 0 ) ) )
   ( define live-branches
      ( filter ( lambda (l) ( not ( empty? l ) ) ) branches )
      )
   ( define ( trim-branch b ) ( map cdr b ) )
   ( define trimmed-live-branches
      ( map list
            ( map caar live-branches )
            ( map trim-branch live-branches )
            )
      )
   trimmed-live-branches
   )


( define ( branch->string trimmed-live-branch )
   ( define branch trimmed-live-branch )
   ( define the-steam ( car branch ) )
   ( define the-leaves ( cadr branch ) )
   ( define stem-string ( number->string the-steam ) )
   ( define leaf-string ( string-join ( map number->string the-leaves ) " " ) )
   ( define branch-string
      ( string-append
        stem-string
        ":"
        ( blank-string ( - 5 ( string-length stem-string ) ) )
        )
      )
   branch-string
   )

( define ( blank-string n )
   ( cond
      ( ( = n 0 ) "" )
      ( else
        ( string-append " " ( blank-string ( - n 1 ) ) )
        )
      )
   )

( define ( stem-leaf-plot grades )
   ( define tree ( stem-leaf-tree grades ) )
   ( display-stem-leaf-tree tree )
   ( display "")
   )
( define ( display-stem-leaf-tree tree )
   ( map display ( map branch->string tree ) )
   )