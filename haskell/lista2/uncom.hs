main = do
   sentence_1 <- getLine
   sentence_2 <- getLine
   let result = uncommonFromTwoSentences sentence_1 sentence_2
   print result

toLower :: String -> String
toLower [] = []
toLower (a:as) = toLower_aux a : toLower as
   where toLower_aux a
            | (a < 'a' || a > 'z') && a /= ' ' = toEnum (fromEnum a + 32)
            | otherwise = a

separaUntillSpace :: String -> (String, String)
separaUntillSpace "" = ([], [])
separaUntillSpace (a:as)
   | a /= ' ' = (a : x, y)
   | otherwise = ("", as)
      where (x,y) = separaUntillSpace as

separa :: String -> [String]
separa [] = []
separa (a:as) = x : separa y
   where (x,y) = separaUntillSpace (a:as)

check :: String -> [String] -> [String]
check a (b:bs) = [ x | x <- (b:bs), x == a]

filtra :: [String] -> [String] -> [String]
filtra [] _ = []
filtra _ [] = []
filtra (a:as) (b:bs)
   | length (check a (b:bs)) == 1 = a : filtra as (b:bs)
   | otherwise = filtra as (b:bs)

qsort :: [String] -> [String]
qsort [] = []
qsort (a:as) = qsort ([x | x <- as, x < a]) ++ [a] ++ qsort ([x | x <- as, x >= a])

uncommonFromTwoSentences :: String -> String -> [String]
uncommonFromTwoSentences [] _ = []
uncommonFromTwoSentences _ [] = []
uncommonFromTwoSentences (a:as) (b:bs) = qsort (filtra (x++y) (x++y))
   where x = separa (toLower (a:as))
         y = separa (toLower (b:bs))