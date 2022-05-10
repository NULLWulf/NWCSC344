----------------------------------
-- Part 1 - squareArea -----------

squareArea :: Floating a => a -> a
squareArea x = x * x

----------------------------------
-- Part 2 - circleArea -----------

circleArea :: Floating a => a -> a
circleArea r = (pi * ( r ^ 2) )

----------------------------------
-- Part 3 - blueAreaOfCube -------

blueAreaOfCube :: Floating a => a -> a
blueAreaOfCube x = (6 * s) - (6 * c)
    where s = squareArea x
          c = circleArea (0.25 * x)

----------------------------------
-- Part 4 - paintedCube1 ---------

paintedCube1 :: (Num p, Eq p) => p -> p


paintedCube1 n
   | n == 1 = 0
   | otherwise = ( 6 * ( n - 2 ) ^ 2)

----------------------------------
-- Part 5 - paintedCube2 ---------

paintedCube2 :: (Eq p, Num p) => p -> p
paintedCube2 n
   | n == 1 = 0
   | otherwise = ( 12 * ( n - 2 ) )