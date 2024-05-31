main :: IO ()
main = do
  input <- getLine
  let result = dna1 (read input :: Tree Int)
  print result

data Tree t = Node t (Tree t) (Tree t) | Nilt
  deriving (Read, Show)

transformDNA :: Int -> Char
transformDNA 0 = 'E'
transformDNA 1 = 'M'
transformDNA 2 = 'A'
transformDNA 3 = 'C'
transformDNA 4 = 'S'

concatDNA :: Tree Int -> String
concatDNA Nilt = ""
concatDNA (Node value left right) = concatDNA left ++ [x] ++ concatDNA right
   where x = transformDNA (mod value 5)

partDNA :: String -> [String]
partDNA [] = []
partDNA (a:as) = partDNA_aux (a:as) 0 : partDNA (drop 8 (a:as))
      where partDNA_aux [] _ = []
            partDNA_aux (a:as) x
               | x == 8 = []
               | otherwise = a : partDNA_aux as (x+1)

dna1 :: Tree Int -> [String]
dna1 Nilt = []
dna1 (Node value left right) = partDNA x
   where x = concatDNA (Node value left right)