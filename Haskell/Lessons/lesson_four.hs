-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--- fourth_functions.hs contains some list comprehensions
-----------------------------------------------------------------------------
-- Thing 1

-- | Return list of evenly divisible numbers for n
factors n = [ x | x <- [1..n], n `mod` x == 0 ]

-- | Returns Boool if no event divisible numbers 
prime n = factors n == [1,n]

-- | Return list of prime numbers 
primes n = [ x | x <- [2..n], prime x]

-----------------------------------------------------------------------------
-- Thing 2

p3 w = [ [ a,b,c ] | a <- w, b <- w, c <- w, distinct [a,b,c] ]

p4 w = [ [a,b,c,d] | a <- w, b <- w, c <- w, d <-w, distinct [a,b,c,d]]

p5 w = [ [a,b,c,d,e] | a <- w, b <- w, c <- w, d <- w, e <- w, distinct [a,b,c,d,e] ]

distinct [] = True
distinct (x:xs) = if ( elem x xs ) then False else distinct xs

-----------------------------------------------------------------------------
-- Thing 3

laughter digits = [ if ( odd d) then "HA" else "HE" | d <- digits ]

-----------------------------------------------------------------------------
-- Thing 4
inps = [ a ++ " " ++ q ++ " " ++ n |
         a <- articles, q <- adjectives, n <- nouns, match a q
        ]
    where articles = ["a","an"]
          adjectives = ["orange","blue","weird","elegant"]
          nouns = ["cow","computer","coffee cup"]
          match "a" (f:_) = elem f "bcdfghjklmnpqrstvwxyz"
          match "an" (f:_) = elem f "aeiou"