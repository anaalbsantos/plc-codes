--questão 1
count :: [Int] -> Int
count [] = 0
count (a:as)
   | a == 0 = 1 + count as
   | otherwise = 0

rlencode :: [Int] -> [Int]
rlencode [] = []
rlencode (a:as)
   | a /= 0 = a : rlencode as
   | otherwise = a :  (1 + x) : rlencode (drop x as)
      where x = count as

mult :: Int -> [Int]
mult 0 = []
mult x = 0 : mult (x-1)

rldecode :: [Int] -> [Int]
rldecode [] = []
rldecode (0:as:as1) = mult as ++ rldecode as1
rldecode (x:xs) = x : rldecode xs

--questão 2
countChar :: Char -> String -> Int
countChar _ [] = 0
countChar x (a:as)
   | x == a = 1 + countChar x as
   | otherwise = 0

rlencodeLetras :: String -> String
rlencodeLetras [] = []
rlencodeLetras [a] = [a]
rlencodeLetras (a:as:as1)
   | a == as = a : show (2 + x) ++ rlencodeLetras (drop x as1)
   | otherwise = a : rlencodeLetras (as:as1)
      where x = countChar a as1

check :: Char -> Int
check '0' = 0
check '1' = 1
check '2' = 2
check '3' = 3
check '4' = 4
check '5' = 5
check '6' = 6
check '7' = 7
check '8' = 8
check '9' = 9
check x = -1

multChar :: Char -> Int -> String
multChar _ 0 = ""
multChar c x = c : multChar c (x-1)

rldecodeLetras :: String -> String
rldecodeLetras [] = []
rldecodeLetras [a] = [a]
rldecodeLetras (a:as:as1)
   | x == -1 = a : rldecodeLetras (as:as1)
   | otherwise =  multChar a x ++ rldecodeLetras as1
      where x = check as

-- questão 3
data Letra = Unica Char | Repetida Char Int deriving Show

rlencodeLetrasCode :: String -> [Letra]
rlencodeLetrasCode [] = []
rlencodeLetrasCode [a] = [Unica a]
rlencodeLetrasCode (a:as:as1)
   | a == as = Repetida a (2 + x) : rlencodeLetrasCode (drop x as1)
   | otherwise = Unica a : rlencodeLetrasCode (as:as1)
      where x = countChar a as1

rldecodeLetrasCode :: [Letra] -> String
rldecodeLetrasCode [] = []
rldecodeLetrasCode (Unica a : as) = a : rldecodeLetrasCode as
rldecodeLetrasCode (Repetida a x : as) = multChar a x ++ rldecodeLetrasCode as