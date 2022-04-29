filter' f xs = [ x | x <- xs, f x]
filter'' f [] = []
filter'' f (x:xs) = if ( f x ) then ( x : y ) else y where y = filter'' f xs