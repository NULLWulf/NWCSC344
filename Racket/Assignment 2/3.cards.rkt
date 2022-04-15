#lang racket

( require racket/trace )

( define ( ranks rank )
   ( list
     ( list rank 'C )
     ( list rank 'D )
     ( list rank 'H )
     ( list rank 'S )
     )
   )

( define ( deck )
   ( append
     ( ranks 2 )
     ( ranks 3 )
     ( ranks 4 )
     ( ranks 5 )
     ( ranks 6 )
     ( ranks 7 )
     ( ranks 8 )
     ( ranks 9 )
     ( ranks 'X )
     ( ranks 'J )
     ( ranks 'Q )
     ( ranks 'K )
     ( ranks 'A )
     )
   )

( define ( pick-a-card )
   ( define cards ( deck ) )
   ( list-ref cards ( random ( length cards ) ) )
   )

( define ( show card )
   ( display ( rank card ) )
   ( display ( suit card ) )
   )

( define ( rank card )
   ( car card )
   )

( define ( suit card )
   ( cadr card )
   )

( define ( red? card )
   ( or
     ( equal? ( suit card ) 'D )
     ( equal? ( suit card ) 'H )
     )
   )

( define ( black? card )
   ( not ( red? card ) )
   )

( define ( aces? card1 card2 )
   ( and
     ( equal? ( rank card1 ) 'A )
     ( equal? ( rank card2 ) 'A )
     )
   )

( define ( pick-two-cards )
   ( list ( pick-a-card ) ( pick-a-card ) ) )

( define ( rank-indexer card )
   ( define card-rank ( car card ))
   ( cond
      [(number? card-rank) card-rank]
      [else (face-card-indexer card-rank)]))

( define ( face-card-indexer card-rank )
   ( cond
      [(eq? 'X card-rank)10]
      [(eq? 'J card-rank)11]
      [(eq? 'Q card-rank)12]
      [(eq? 'K card-rank)13]
      [(eq? 'A card-rank)14]
      [else 0]))

( define ( higher-rank card1 card2 )
   ( define card1-rank ( rank-indexer card1 ) )
   ( define card2-rank ( rank-indexer card2 ) )
   ( cond
      [(< card1-rank card2-rank)display (car card2)]
      [(> card1-rank card2-rank)display (car card1)] ))


;( trace higher-rank )

( define ( classify-two-cards-ur card-pair )
   ( define card1 ( car card-pair ) )
   ( define card2 ( cadr card-pair ) )
   ( define card1-rank ( rank-indexer card1))
   ( define card2-rank ( rank-indexer card2))
   ( define card1-suit ( suit card1))
   ( define card2-suit ( suit card2))
   ( define high-card ( higher-rank card1 card2))
   ( display card-pair)
   (display ": ")
   ( cond
      ((equal? card1-suit card2-suit)
       (cond
         ((or
           (= 1 ( - card1-rank card2-rank))
           (= 1 ( - card2-rank card1-rank)))
          (display high-card) (display " high straight flush" )))
       (else
        (display high-card) (display " high flush "))))
   (else
    (cond
      ((or
        (= 1 ( - card1-rank card2-rank))
        (= 1 ( - card2-rank card1-rank))
        (display high-card) (display " high straight" )))
      (else
       (cond
         ((equal? (car card1) (car card2))
          (display "Pair of " ) (display (car card1))(display "'s"))
         (else
          (display high-card) (display " high" )))))))












