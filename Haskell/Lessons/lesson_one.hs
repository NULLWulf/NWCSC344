----------------------------------------------------------------------
----------------------------------------------------------------------
--- first_functions.hs contains some simple numeric function
--- definitions
----------------------------------------------------------------------
-- Thing 1
square x = x * x

distance (x1,y1) (x2,y2) = sqrt ( ds1 + ds2 )
    where ds1 = square (x1 - x2) 
          ds2 = square (y1 - y2) 

perimeter (x1,y1) (x2,y2) (x3,y3) = a + b + c
    where a = distance (x1,y1) (x2,y2)
          b = distance (x2,y2) (x3,y3)
          c = distance (x3,y3) (x1,y1)

----------------------------------------------------------------------
-- Thing 2

total_word_length w1 w2 = (l1 + l2)
    where l1 = length w1
          l2 = length w2

average_word_length w1 w2 = fromIntegral ( l1 + l2) / 2.0
    where l1 = length w1
          l2 = length w2

----------------------------------------------------------------------
-- Thing 3
factorial :: Integer -> Integer
factorial x = if ( x == 1) then 1 else x * factorial (x - 1)


----------------------------------------------------------------------
-- Thing 4 Area of a triangle

triangle b h = b * h * 0.5


--- Thing 5
circle_area_wradius r = (pi * ( r ^ 2) )
circle_area_wdiam d = a
    where a = circle_area_wradius ( d / 2)
sphere_surface_wradius r = s 
    where s = ( 4 * (circle_area_wradius r) )
sphere_surface_wdiam d = s 
    where s = ( sphere_surface_wradius ( d / 2) )

pi_mod r e = ( pi * ( r ^ e ) )

volume_w_radius r = ( 4 / 3) * ( pi_mod r 3 )