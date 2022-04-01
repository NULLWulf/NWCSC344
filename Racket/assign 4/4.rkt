#lang racket

( define ( assoc o a-list )
   ( cond
      ( ( empty? a-list ) '() )
      ( ( eq? o ( caar a-list ) )( car a-list))
      ( else ( assoc o ( cdr a-list ) ) )
      )
   )


;;;; Uses a-list from Question 3

( define ( a-list l-one l-two )
   ( cond 
      ( ( empty? l-one ) '() )
      ( else ( cons ( cons ( car l-one) ( car l-two) )
                    ( a-list ( cdr l-one ) ( cdr l-two ) ) )
             )
      )
   )
( define al1
   ( a-list '(one two three four ) '(un deux trois quatre ) )
   )

( define al2
   ( a-list '(one two three) '( (1) (2 2) (3 3 3) ) ) )

