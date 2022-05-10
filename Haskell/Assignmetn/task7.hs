--------------------------------
--- nVPI -----------------------

---- Test Data -----------------
a :: [Int]
a = [2,5,1,3]

b :: [Int]
b = [1,3,6,2,5]

c :: [Int]
c = [4,4,2,1,1,2,2,4,4,8]

u :: [Int]
u = [2,2,2,2,2,2,2,2,2,2]

x :: [Int]
x = [1,9,2,8,3,7,2,8,1,9]

---- Pairwise Functions -----------------
pairwiseValues :: [Int] -> [(Int,Int)]
pairwiseValues l = zip (init l) (tail l)

pairwiseDifferences :: [Int] -> [Int]
pairwiseDifferences l = map (\(x, y) -> x - y) ( pairwiseValues l )

pairwiseSums :: [Int] -> [Int]
pairwiseSums l = map (\(x, y) -> x + y) ( pairwiseValues l )

half :: Int -> Double
half number = ( fromIntegral number ) / 2

pairwiseHalves :: [Int] -> [Double]
pairwiseHalves = map (\x -> half x)

pairwiseHalfSums :: [Int] -> [Double]
pairwiseHalfSums = pairwiseHalves . pairwiseSums

pairwiseTermPairs :: [Int] -> [(Int,Double)]
pairwiseTermPairs l = zip (pairwiseDifferences l) (pairwiseHalfSums l)

term :: (Int, Double) -> Double
term ndPair = abs (fromIntegral (fst ndPair) / snd ndPair)

pairwiseTerms :: [Int] -> [Double]
pairwiseTerms l = map term (pairwiseTermPairs l)

nPVI :: [Int] -> Double
nPVI l = normalizer l * sum (pairwiseTerms l)
    where normalizer l = 100 / fromIntegral ((length l) - 1)