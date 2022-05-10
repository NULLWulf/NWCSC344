import Data.List
import System.IO

doubleEvenNumber y
    | y `mod` 2 /= 0 = y
    | otherwise = y * 2
