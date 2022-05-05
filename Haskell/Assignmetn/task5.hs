----------------------------------
-- Part 1 - count  ---------------

count :: Eq a => a -> [a] -> Int
count p [] = 0
count p l = length [ x | x <- l, x == p ]


----------------------------------
-- Part 2 - freqTable  ------------

freqTable :: Eq a => [a] -> [(a, Int)]
freqTable l = [ (x, count x l) | x <- list2set l]

list2set :: Eq a => [a] -> [a]
list2set [] = []
list2set (x:xs) = if (elem x xs ) 
    then list2set(xs)
    else x:(list2set(xs))
