import Data.List
import System.IO

-- Int -2^63 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Bool True False
-- Char '
-- Tuples (list of values)

always5 :: Int
always5 = 5

----------------------------------------------------------------
sumOfNums = sum [1..100]

addEx = 5 + 4
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4

modEx = mod 5 4
modEx2 = 5 `mod` 4


----------------------------------------------------------------
regNumEx = 5 + (-4)

----------------------------------------------------------------
num9 = 9 :: Int
sqrtOf9 = sqrt (fromIntegral num9)

----------------------------------------------------------------
primeNumbers = [3,5,7,11]

morePrimeNumbers = primeNumbers ++ [13,17,19,23,29]

----------------------------------------------------------------

favNumbs = 2 : 7 : 21 : 66 : []


-------------------------------
multList = [[3,5,7],[11,13,17]]

morePrimes2 = 2 : morePrimeNumbers

lenPrime = length morePrimes2

----------------------------------------------------------------
revPrime = reverse morePrimes2

isListEmpty = null morePrimes2

secondPrime = morePrimes2 !! 1 

firstPrime = head morePrimes2

lastPrime = morePrimes2

primeInit = init morePrimes2

first3Primes = take 3 morePrimes2

is7InList = 7 `elem` morePrimes2

is7InListPre = elem 7 morePrimes2

maxPrime = maximum morePrimes2
minPrime = minimum morePrimes2

-----------
zeroToTne = [0..10]

px = zeroToTne

evenList = [2,4..20]

letterList = ['A','C'..'F']

infinPow10 = [10,20..]

many2s = take 10 (repeat 2)

many3s = replicate 10 3

cycleList = take 10 (cycle [1,2,3,4,5])

listTime2 = [x * 2 | x <- [1..10]]

listTime3 = [x * 3 | x <- [1..10], x * 3 <= 50]

sexDivis = [x | x <- [1..500], x `mod` 13 == 0, mod x 9 == 0]

sortedList = sort [7,21,3,4,3,32]

sumOfList = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]

morePrimes = morePrimes2

listBiggerThen5 = filter (>5) morePrimes

evensUpTo20 = takeWhile (<=20) [2,4..]

multOfList = foldr (*) 1 [2,3,4,5]

names = ["Nathan","Jason","Matt"]
addresses = ["123 Main","234 North","567 South"]

namesNAddress = zip names addresses

