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
paintedCube1 n = 
    if (n == 1) then 0
    else ( 6 * ( n - 2 ) ^ 2)

----------------------------------
-- Part 5 - paintedCube2 ---------

paintedCube2 :: (Eq p, Num p) => p -> p
paintedCube2 n = 
    if (n == 1) then 0
    else ( 12 * ( n - 2 ) )