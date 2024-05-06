--Listas: coleção de objetos do mesmo tipo
    -- construtor polimórfico de listas: (aceita qualquer tipo)
    -- (:) :: t -> [t] -> [t]

{-somar elementos de uma lista-}
sumList :: [Int] -> Int
sumList [] = 0
sumList (a:as) = a + sumList as

{-dobrar os elementos de uma lista-}
double :: [Int] -> [Int]
double [] = []
double (a:as) = (2*a: double as) 

{-verificar se um elemento está na lista-}
member :: [Int] -> Int -> Bool
member [] x = False
member (a:as) x = (a == x || member as x)

{-filtra os números de uma string-}
digits :: String -> String
digits [] = []
digits (a:as)
    | a == '1' || a == '2' || a == '3' || a == '4' || a == '5' || a == '6' || a == '7' || a == '8' || a == '9' = [a] ++ (digits as)
    | otherwise = digits as



--case
-- firstDigit :: String -> Char
-- firstDigit st = case (digits st) of
--                     [] -> '\0'
--                     (a:as) -> a