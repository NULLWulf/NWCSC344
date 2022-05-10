--------------------------------
-- Part 1 - tgl  ---------------

tgl :: Int -> Int
tgl i = foldl (+) 0 [1..i]

--------------------------------
-- Part 2 triangleSequence -----

triangleSequence :: Int -> [Int]
triangleSequence i = map tgl [1..i]


--------------------------------
-- Part 3 vowelCount -----------

vowels = "aeiou"
vowelCount :: [Char] -> Int
vowelCount l = length vList where
    vList = filter (\x -> elem x vowels) l

--------------------------------
-- Part 4 lcsim ----------------

lcsim :: (a -> b) -> (a -> Bool) -> [a] -> [b] 
lcsim f p l = map f ( filter  p l )