----------------------------------
-- Part 1 - list2set -------------

list2set :: Eq a => [a] -> [a]
list2set [] = []
list2set (x:xs)
    | elem x xs = list2set(xs)
    | otherwise = x:(list2set(xs))

----------------------------------
-- Part 2 - averageWordLength ----

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome (x:[]) = True
isPalindrome l
   | head l == last l = isPalindrome (tail(init l))
   | otherwise = False

----------------------------------
-- Part 3 - collatz --------------

collatz :: Integral a => a -> [a]
collatz n
   | n `mod` 2 == 0 = n:(collatz ( n `div` 2))
   | n == 1 = [1]
   | otherwise = n:(collatz ( 3 * n + 1)) 