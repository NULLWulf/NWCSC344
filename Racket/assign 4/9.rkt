#lang racket

( define ( a-list l-one l-two )
   ( cond 
      ( ( empty? l-one ) '() )
      ( else ( cons ( cons ( car l-one) ( car l-two) )
                    ( a-list ( cdr l-one ) ( cdr l-two ) ) ) ) ))

( define ( generate-list n o )
   ( cond
      ( ( eq? n 0 ) '() )
      ( else
        ( cons ( o ) ( generate-list ( - n 1 ) o ) ))))

( define ( flip-coin )
   ( define outcome ( random 2 ) )
   ( cond
      ( ( = outcome 0 ) 't )
      ( ( = outcome 1 ) 'h ) ))

( define ( count o l )
   ( cond
      ( ( empty? l ) 0 )
      ( ( eq? o ( car l ) ) ( + 1 ( count o (cdr l ) ) ) )
      ( else ( count o ( cdr l ) ) )) )

( define ( list->set l )
   ( cond
      ( ( empty? l ) '() )
      ( ( member ( car l ) ( cdr l ) ) ( list->set ( cdr l ) ) )
      ( else ( cons ( car l ) ( list->set ( cdr l ) ) ) )))

( define (ft the-list)
   ( define the-set (list->set the-list))
   ( define the-counts
      ( map (lambda (x) (count x the-list)) the-set))
   ( define association-list (a-list the-set the-counts))
   ( sort association-list < #:key car))

( define ( ft-visualizer ft)
   ( map pair-visualizer ft)
   ( display ""))

( define (pair-visualizer pair)
   ( define label ( string-append ( number->string (car pair)) ":"))
   ( define fixed-size-label ( add-blanks label (- 5 (string-length label))))
   ( display fixed-size-label)
   ( display (foldr string-append "" (make-list (cdr pair) "*")))
   ( display "\n"))

( define ( inc-decr ht )
   ( cond
      ( ( eq? ht 'h ) 1 )
      ( else -1 )))

( define (add-blanks s n)
   ( cond
      (( = n 0)
       s)
      ( else
        ( add-blanks ( string-append s " ") (- n 1)))))

( define ( flip-for-offset n )
   ( define h-t ( generate-list n flip-coin ) )
   ( define all ( map ( λ ( x ) ( inc-decr x ) ) h-t ) )
   ( foldr + 0 all ))

( define ( demo-for-flip-for-offset )
   ( define offsets
      ( generate-list 100 ( λ () ( flip-for-offset 50 ))))
   ( ft-visualizer ( ft offsets )))









