----------------------------------
-- Part 1 - list2set -------------

list2set :: Eq a => [a] -> [a]
list2set [] = []
list2set (x:xs) = if (elem x xs ) then list2set(xs)
    else x:(list2set(xs))

----------------------------------
-- Part 2 - averageWordLength ----

isPalindrome [] = True
isPalindrome (x:[]) = True
isPalindrome l = if ( head l == last l) 
    then isPalindrome (tail(init l))
    else False