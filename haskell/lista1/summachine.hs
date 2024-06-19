main = do
       lista <- getLine
       print $ soma (read lista :: [Int])

check :: [Int] -> Bool
check [] = False
check (a:as) = (a == 0)

return_head :: [Int] -> Int
return_head [] = 0
return_head (a:as) = a

soma :: [Int] -> ([Int], [Int])
soma [] = ([], [])
soma (a:as)
    | a == 0 && (check as) = ([], [])
    | a == 0 = ([], as)
    | otherwise = ([a + return_head(x)], y)
        where (x,y) = soma as

maquinaSomar :: [Int] -> [Int]
maquinaSomar [] = []
maquinaSomar (a:as) = x ++ maquinaSomar y
    where (x,y) = soma (a:as)