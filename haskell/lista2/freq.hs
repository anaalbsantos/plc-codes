main = do
  lista <- getLine
  print $ palavrasFrequentes (read lista :: [String])

countOne :: [String] -> String -> (String,Int)
countOne [] x = (x,0)
countOne (a:as) x = (x, length ([b | b <- (a:as), b == x]))

countFreq :: [String] -> [(String, Int)]
countFreq [] = []
countFreq (a:as) = countOne (a:as) a : countFreq [b | b <- (a:as), b/= a]

qsort :: [(String, Int)] -> [(String,Int)]
qsort [] = []
qsort ((a,b):as) = qsort [(x,y) | (x,y) <- as, y > b || (y == b && length x < length a)]
                     ++ [(a,b)] 
                     ++ qsort [(z,w) | (z,w) <- as, w < b || (w == b && length z > length a)]

imprime3 :: [String] -> Int -> [String]
imprime3 [] _ = []
imprime3 (a:as) x 
   | x == 3 = []
   | otherwise = a : imprime3 as (x+1)


palavrasFrequentes :: [String] -> [String]
palavrasFrequentes [] = []
palavrasFrequentes (a:as) = imprime3 (y:ys) 0
   where (x:xs) = qsort (countFreq (a:as))
         (y:ys) = map fst (x:xs)