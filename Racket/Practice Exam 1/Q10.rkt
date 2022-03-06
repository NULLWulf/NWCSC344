#lang racket

( define ( noun )
   ( define r  ( random 6 )  )
   ( cond
      [( = r 0 ) 'kitty]
      [( = r 1 ) 'robot]
      [( = r 2 ) 'jabberwock]
      [( = r 3 ) 'professor]
      [( = r 4 ) 'king]
      [( = r 5 ) 'monster] ))

( define ( adjective )
   ( define r  ( random 5 )  )
   ( cond
      [( = r 0 ) 'ancient]
      [( = r 1 ) 'insane]
      [( = r 2 ) 'blue-eyed]
      [( = r 3 ) 'silvery]
      [( = r 4 ) 'methodical]
      [( = r 5 ) 'enormous]
      [( = r 5 ) 'enormous]))

( define ( noun-phrase )
   ( define n  ( random 2 5 )  )
   ( cond
      [(= n 2 ) ( list 'the (noun) )]
      [(= n 3 )( list 'the ( adjective ) (noun) )]
      [(= n 4)( list 'the ( adjective ) ( adjective ) ( noun ) )  ] ) )

( define ( bank-of-noun-phrases )
   ( define r 5 )
   ( cond
      [( = r 0 ) (noun-phrase)]
      [( = r 1 ) (list (noun-phrase)(noun-phrase))]
      [( = r 2 ) (list (noun-phrase)(noun-phrase)(noun-phrase))]
      [( = r 3 ) (list (noun-phrase)(noun-phrase)(noun-phrase)(noun-phrase))]
      [( = r 4 ) (list (noun-phrase)(noun-phrase)(noun-phrase)(noun-phrase)(noun-phrase))]
      [( = r 5 ) (list (noun-phrase)(noun-phrase)(noun-phrase)(noun-phrase)(noun-phrase))])) 
      
      