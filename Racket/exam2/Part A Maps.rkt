#lang racket

( define complex-words '("pedenatic" "supercalifragilistic" "expdialaditious"
                                     "mississippi" "tennesssee" "new york city" "newport news" "hella fresh") )

( define odd-numbers '( 3 5 7 11 15 19 21 ) )

( define cities '( ("albany" "ny") ("oswego" "ny") ("plattsburg" "ny")
                                   ("knoxville" "tn") ("memphis" "tn") ("harrisburg" "pa")
                                   ("bing" "ny") ("denver" "co") ("red rocks" "co")))
( define ( generate-grades n )
   ( map random (make-list n 101 ) ) )

( define filt-cities ( filter ( λ (cities) (< (string-length (car cities)) 5 )) cities ))
( define ny-cities (filter (λ (city) (eq? "ny" (second city))) cities))

( define ( filtCities state )
   ( define s state)
   (filter (λ (city st) (eq? st (second city))) (cities s)))
   
;;;  ( map ( λ (n) ( + 1 n )) '(1 2 3 4 5 6 7 8 9 10 )) 
;; '(2 3 4 5 6 7 8 9 10 11)

( define multiples ( map ( λ (number) ( * 2 number ) ) '(10 20 30 40 50 ) ) )

( define divide-five ( map ( λ (n) ( / n 5 ) ) multiples ) )

( define ( int-after div ) ( filter ( λ (n d) (integer? ( / n d ) ) ) (divide-five div ) ) )







