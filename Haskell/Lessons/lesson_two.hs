-- Thing 1

lucky :: Int -> String 
lucky 7 = "Lucky Number Seven!"
lucky x = "Sorry, Pal.  Better luck next time"

lucky' :: Int -> String
lucky' x = if ( x == 7) then
                "Lucky number seven!"
            else
                "Sorry,pal, you are out of luck!"
            
---------------------------------------------------------------------------------------
-- Thing 2

digit2name :: Int -> String
digit2name 1 = "one"
digit2name 2 = "two"
digit2name 3 = "three"
digit2name 4 = "four"
digit2name 5 = "five"
digit2name x = "Not in the proper range"
digit2name' :: Int -> String
digit2name' x =
    if ( x == 1 ) then "one" else
    if ( x == 2 ) then "two" else
    if ( x == 3 ) then "three" else
    if ( x == 4 ) then "four" else
    if ( x == 5 ) then "five" else
    "Not in the proper range"
--------------------------------
-- Thing 3

factorial' :: Integer -> Integer
factorial' 1 = 1
factorial' x = x * factorial' ( x - 1 )