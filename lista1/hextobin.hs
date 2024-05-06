main = do
    s <- getLine
    let result = htob s
    print result

htob :: String -> String
htob [] = []
htob (a:as) = case a of
                '1' -> "0001" ++ htob as
                '2' -> "0010" ++ htob as
                '3' -> "0011" ++ htob as
                '4' -> "0100" ++ htob as
                '5' -> "0101" ++ htob as
                '6' -> "0110" ++ htob as
                '7' -> "0111" ++ htob as
                '8' -> "1000" ++ htob as
                '9' -> "1001" ++ htob as
                'A' -> "1010" ++ htob as
                'B' -> "1011" ++ htob as
                'C' -> "1100" ++ htob as
                'D' -> "1101" ++ htob as
                'E' -> "1110" ++ htob as
                'F' -> "1111" ++ htob as
                otherwise -> "0000" ++ htob as
