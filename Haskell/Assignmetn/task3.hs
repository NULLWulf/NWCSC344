----------------------------------
-- Part 1 - reverseWords ---------

reverseWords :: String -> [String]
reverseWords l = (reverse ( words l ) )

----------------------------------
-- Part 2 - averageWordLength ----

averageWordLength :: Fractional a => [Char] -> a
averageWordLength l = fromIntegral t / fromIntegral ( length lol )
    where low = words l
          lol = map length low
          t = sum lol
