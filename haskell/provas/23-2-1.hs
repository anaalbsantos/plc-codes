-- questão 1
insert :: Ord t => [t] -> [t] -> Int -> [t]
insert [] [] _ = []
insert [] (b:bs) _ = b:bs
insert (a:as) [] _ = a:as
insert (a:as) (b:bs) x = take x (b:bs) ++ (a:as) ++ drop x (b:bs)

--questão 2
check :: Eq t => t -> [t] -> Bool
check _ [] = False
check x (a:as) = x == a || check x as

count :: Eq t => t -> [t] -> Int
count _ [] = -1
count x (a:as)
   | a == x = 0
   | otherwise = 1 + count x as

search :: Eq t => t -> [t] -> Int
search _ [] = -1
search x (a:as)
   | not (check x (a:as)) = -1
   | otherwise = count x (a:as)

--outro método
newSearch :: Eq t => t -> [t] -> Int
newSearch _ [] = -1
newSearch x (a:as) = newSearchAux x (a:as) 0
   where newSearchAux _ [] _ = -1
         newSearchAux x (a:as) i
            | x == a = i
            | otherwise = newSearchAux x as (i+1)


--questão 3
data TimeOfDay = AM Int Int -- hora e minuto antes do meio dia 
                | PM Int Int -- hora e minuto após o meio dia
                deriving (Show)
               

somaMinutos :: TimeOfDay -> Int -> TimeOfDay
somaMinutos (AM h m) x
   | (m+x) < 60 = AM h (m+x)
   | hora < 12 = AM hora minut
   | otherwise = PM (mod hora 12) minut
      where hora = h + div (m+x) 60
            minut = mod (m+x) 60
somaMinutos (PM h m) x
   | (m+x) < 60 = PM h (m+x)
   | hora < 12 = PM hora minut
   | otherwise = AM (mod hora 12) minut
      where hora = h + div (m+x) 60
            minut = mod (m+x) 60

--questão 4
data Resultado t = Success t | Fail
                    deriving Show

convertTime :: Int -> Int -> Resultado TimeOfDay
convertTime h m
   | h > 23 || m > 59 = Fail
   | h < 12 = Success (AM h m)
   | otherwise = Success (PM (h-12) m)