main = do
  lista <- getLine
  print $ suaviza (read lista :: [Float])

transform :: Float -> Float -> Float -> Float
transform a b c = (a + b + c)/3

check :: [Float] -> Float -> [Float]
check [] _ = []
check [a] _ = [a]
check (a:as:as1) x = transform x a as : check (as:as1) a

suaviza :: [Float] -> [Float]
suaviza [] = []
suaviza (a:as) = a : check as a