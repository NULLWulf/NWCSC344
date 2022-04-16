#lang racket
( define ( generate-grades n ) ;; make a list of grades from random 0 to 100
   ( map random ( make-list n 101 ) )
   )

( define ( stem grade )  ;; get first number, e.g. 70, get 7 
   ( quotient grade 10 )
   )
( define ( leaf grade ) ;; get first number, e.g. 70 get 0 
   ( remainder grade 10 )
   )

( define ( grade-pair grade ) ( cons ( stem grade ) ( leaf grade ) ) )

( define ( stem-leaf-tree-lf grades )
   ( echo 'grades grades )
   ( define sorted-grades ( sort grades > ) )  ;; define list of sorted grades
   ( echo 'sorted-grades sorted-grades )       ;; greatest to least 
   ( define stems ( map stem sorted-grades ) )  ;; apply stems to stems list 
   ( echo 'stems stems )
   ( define leaves ( map leaf sorted-grades ) )  ;; apply leafs to leaf list 
   ( echo 'leaves leaves )
   ( define a-list ( map cons stems leaves ) ) ;; created dotted pair list of stems and leaves
   ;; and apply to it association list 
   ( echo 'a-list a-list )
   ( define ( branch n ) ( filter ( λ ( x ) ( = ( car x ) n ) ) a-list) ) ;; define 
   ( define branches ( map branch ( list 10 9 8 7 6 5 4 3 2 1 0 ) ) )
   ;; create grouped list with branches matching each numerical section from 0 to 10 
   ( echo 'branches branches )
   ( define live-branches ;; simply removes empty list although stores it in another list 
      ( filter ( λ (l) ( not ( empty? l ) ) ) branches ) )
   ( echo 'live-branches live-branches )
   ( define ( trim-branch b ) ( map cdr b ) ) ;; remove encapsulation
   ( give-me live-branches )
   ( define trimmed-live-branches
      ;; Create a final list that
      ;; Takes gets the first of the dotted order pair and applies all then gets the
      ;; ??? 
      ( map list 
            ( map caar live-branches )
            ( map trim-branch live-branches )
            )
      )
   ( echo 'trimmed-live-branches trimmed-live-branches )
   trimmed-live-branches
   )

( define (give-me l) l )

( define ( echo symbol value )
   ( display symbol )
   ( display " --> " )
   ( display value )
   ( display "\n\n" )
   )
