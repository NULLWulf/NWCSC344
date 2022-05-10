import Data.List
import System.IO

addMe :: Int -> Int -> Int

-- funcName param1 param2 = operations (returned value)

addMe x y = x + y


sumMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x,y) (x2,y2) = (x + x2, y + y2)

whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You're an adult"
whatAge x = "Nothing important"

factorial :: Int -> Int

factorial 0 = 1
factorial n = n * factorial ( n - 1)

-------------------------------
prodFact n = product [1..n]

----------------------------------------------------------------

isOdd :: Int -> Bool

isOdd n 
    | n `mod` 2 == 0 = False
    | otherwise = True


isEven n = n `mod` 2 == 0

-------------------------------

whatGrade :: Int -> String

whatGrade age
   | (age >= 5) && (age <= 6) = "Kindergarten"
   | (age > 6) && (age <= 10) = "Elementary"
   | (age > 10) && (age <= 14) = "Middle School"
   | (age > 14) && (age <= 18) = "High School"
   | otherwise = "Go To College"

--   Baseball

   
batAverageRate :: Double -> Double -> String

batAverageRate hits atBats
   | avg <= 0.200 = "Terrible Batting Average"
   | avg <= 0.250 = "Average Player"
   | avg <= 0.280 = "You're a superstar"
   where avg = hits / atBats
