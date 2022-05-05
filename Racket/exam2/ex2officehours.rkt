#lang racket

( define ( mono? o )
   ( equal? ( sort o < ) o ) )

( define ( mono-lists o )
   ( filter ( λ ( x ) ( mono? x ) ) o ) )