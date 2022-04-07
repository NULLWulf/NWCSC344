#lang racket

( require 2htdp/image)

( define pitch-classes '( c d e f g a b ) )

( define ( a-list l-one l-two )
   ( cond 
      ( ( empty? l-one ) '() )
      ( else ( cons ( cons ( car l-one) ( car l-two) )
                    ( a-list ( cdr l-one ) ( cdr l-two ) ) )
             )
      )
   )

( define color-names '( blue green brown purple red yellow orange ) )

( define ( box color )
   ( overlay
     ( square 30 "solid" color )
     ( square 35 "solid" "black" )
     )
   )

( define boxes
   ( list
     ( box "blue" )
     ( box "green" )/
     ( box "brown" )
     ( box "purple" )
     ( box "red" )
     ( box "gold" )
     ( box "orange" )
     )
   )

( define pc-a-list ( a-list pitch-classes color-names ) )

( define cb-a-list ( a-list color-names boxes ) )

( define ( pc->color pc )
   ( cdr ( assoc pc pc-a-list ) )
   )

( define ( color->box color )
   ( cdr ( assoc color cb-a-list ) )
   )

( define ( play pitches )
   ( define colors ( map ( λ ( n ) ( pc->color n ) ) pitches ) )
   ( define series-of-boxes ( map ( λ ( n ) ( color->box n ) ) colors ) )
   ( foldr beside empty-image series-of-boxes)
   )