----------------------------------
-- Part 1 - list2set -------------

list2set :: Eq a => [a] -> [a]
list2set [] = []
list2set (x:xs) = if (elem x xs ) 
    then list2set(xs)
    else x:(list2set(xs))

----------------------------------
-- Part 2 - averageWordLength ----

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome (x:[]) = True
isPalindrome l = if ( head l == last l ) 
    then isPalindrome (tail(init l))
    else False

----------------------------------
-- Part 3 - collatz --------------

collatz :: Integral a => a -> [a]
collatz n = 
    if ((n `mod` 2 ) == 0) then n:(collatz ( n `div` 2)) else
    if n == 1 then [1] else
    n:(collatz ( 3 * n + 1))