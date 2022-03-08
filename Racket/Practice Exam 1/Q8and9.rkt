#lang racket

( car '( 1 2 3 ) )
( cdr '( 1 2 3 ) )
( cons '( 1 2 3 ) '( 1 2 3) )
( quote quote )
( ( lambda ( x ) ( cdr x ) ) '( x y z ) )
( ( lambda ( x y ) ( cons y ( cons x '() ) ) ) 'two 'one )

( define a '( 2 0 2 1 ) )
( define b '(( 2 0 ) ( 2 1 ) ) )
( cons a b )

( list a b )
( list a b )
( append a b )
( list-ref ( append a ( cdr a ) ) 6 )
( and ( = ( length a ) 4 ) ( = ( length b ) 2 ) )
( or ( < ( car a ) 1 ) ( > ( car ( cdr a ) ) 1 ) )
( not ( equal? ( cdr ( cdr a ) ) ( car ( cdr b ) ) ) )