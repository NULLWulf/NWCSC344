---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--- third_functions.hs contains some simple list processing function definitions
---------------------------------------------------------------------------------------
-- Thing 1

sum' :: Num p => [p] -> p
sum' [] = 0
sum' (x:xs) = x + sum' xs

---------------------------------------------------------------------------------------
-- Thing 2
head' :: [a] -> a
head' (x:_) = x

tail' :: [a] -> [a]
tail' (_:xs) = xs

-- Thing 3
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
    where n = div (length xs) 2

-- Thing 4: Write third three ways, assuming a list of at least 3 elements
-- head tail reference
third :: [a] -> a
third xs = head ( tail (tail xs ) )

-- Direct Reference
third'' :: [a] -> a
third'' xs = xs !! 2

-- Pattern matching
third''' :: [a] -> a
third''' (_:_:x:_) = x

---------------------------------------------------------------------------------------
-- Thing 5
distinct :: Eq a => [a] -> Bool
distinct [] = True
distinct (x:xs) = if (elem x xs) then False else distinct xs