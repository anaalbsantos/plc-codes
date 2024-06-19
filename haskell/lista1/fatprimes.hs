main = do
      a <- getLine
      let result = fatPrime (read a :: Int)
      print result

isDivisible :: Int -> Int -> Bool
isDivisible x y = (mod x y == 0)

isPrime :: Int -> Bool
isPrime n
    | n == 2 = True
    | (n < 2 || (mod n 2 == 0 && n /= 2)) = False
    | otherwise = isPrimeAux n (ceiling (sqrt (fromIntegral n)))
    where
        isPrimeAux x y
            | y == 2 = True -- quando y chega em 2, é pq não é divisível por nenhum antecessor
            | isDivisible x y = False
            | otherwise = isPrimeAux x (y-1)

primesBefore :: Int -> [Int]
primesBefore 0 = []
primesBefore 1 = []
primesBefore 2 = [2]
primesBefore n = [x | x <- [2..(div n 2)], isPrime x]

check :: Int -> Int -> Int -> [(Int, Int)]
check n a x
    | not (isDivisible n a) && (x /= 0) = [(a,x)]
    | not (isDivisible n a) && (x == 0) = []
    | otherwise = check (div n a) a (x+1)

checkAll :: Int -> [Int] -> [(Int, Int)]
checkAll n [] = []
checkAll n (a:as) = (check n a 0) ++ checkAll n as

fatPrime :: Int -> [(Int, Int)]
fatPrime n = checkAll n primes
    where primes = primesBefore n