main = do
  firstExtract <- words <$> getLine -- equivalente a (read firstExtract :: [String])
  secondExtract <- words <$> getLine
  let result = dna2 firstExtract secondExtract
  print result

data Animal = Cisnal | Iguanoide | Narvale | Null
  deriving (Eq, Show)


compareStr :: String -> String -> Float
compareStr [] [] = 0
compareStr [] _ = 0
compareStr _ [] = 0
compareStr (a:as) (b:bs)
   | a == b = 1 + compareStr as bs
   | otherwise = compareStr as bs

compareVec :: [String] -> [String] -> [Float]
compareVec [] [] = []
compareVec [] _ = []
compareVec _ [] = []
compareVec (a:as) (b:bs) = (x / y) : compareVec as bs
   where x = compareStr a b
         y = fromIntegral (max (length a) (length b))

filterCisnal :: [Float] -> Int
filterCisnal x = length [y | y <- x, y >= 0.1 && y <= 0.3]

filterIguanoide :: [Float] -> Int
filterIguanoide x = length [y | y <- x, y >= 0.4 && y <= 0.7]

filterNarvale :: [Float] -> Int
filterNarvale x = length [y | y <- x, y >= 0.8]

dna2 :: [String] -> [String] -> [Int]
dna2 a b = [filterCisnal x, filterIguanoide x, filterNarvale x]
   where x = compareVec a b

