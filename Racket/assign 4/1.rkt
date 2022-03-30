#lang racket

( require racket/trace )

( define ( count find find-list )
   ( cond
      [(null? find-list) find-list]
      [
      
      