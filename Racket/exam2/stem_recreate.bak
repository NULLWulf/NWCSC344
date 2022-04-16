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

( define ( grade-pair grade ) ( cons ( stem grade ) ( leaf grade ) ) )

( define ( stem-leaf-tree-lf grades )
   ( echo 'grades grades )
   ( define sorted-grades ( sort grades > ) )
   ( echo 'sorted-grades sorted-grades )
   ( define stems ( map stem sorted-grades ) )
   ( echo 'stems stems )
   ( define leaves ( map leaf sorted-grades ) )
   