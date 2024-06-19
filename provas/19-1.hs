-- questão 1
meio :: String -> Int -> Int -> String
meio [] _ _ = ""
meio (a:as) i t = take t (drop (i-1) (a:as))

-- questão 2
localizar :: String -> String -> Int
localizar [] _ = 0
localizar a (b:bs) = localizar_aux a (b:bs) 1
   where localizar_aux a [] _ = 0
         localizar_aux a (b:bs) x
            | a == (take (length a) (b:bs)) = x
            | otherwise = localizar_aux  a bs (x+1)

--questão 3
-- 3.1
data Comando = ParaFrente Int
 | ParaTras Int
 | Escreva Char
 deriving (Show, Eq)
 
posicaofinal :: String -> [Comando] -> Int 
posicaofinal _ [] = 1
posicaofinal a (ParaFrente x:xs) = x + posicaofinal a xs
posicaofinal a (ParaTras y:ys) = - y + posicaofinal a ys
posicaofinal a (Escreva z:zs) = posicaofinal a zs

-- 3.2
escreve :: Int -> Char -> String -> String
escreve x c a  = take (x-1) a ++ c : drop x a

getchar :: Int -> String -> Char
-- getchar _ [] = '-'
getchar 1 (a:as) = a
getchar x (a:as) = getchar (x-1) as

interprete :: String -> [Comando] -> Char
interprete (a:as) [] = a
interprete a b = interprete_aux 1 a b
   where interprete_aux x a [] = getchar x a
         interprete_aux x a (ParaFrente b:bs) = interprete_aux (x+b) a bs
         interprete_aux x a (ParaTras b:bs) = interprete_aux (x-b) a bs
         interprete_aux x a (Escreva b:bs) = interprete_aux x (escreve x b a) bs
            
-- 3.3
estadofinal :: String -> [Comando] -> String
estadofinal (a:as) [] = a:as
estadofinal a b = ef_aux 1 a b
   where ef_aux x a [] = a
         ef_aux x a (ParaFrente b:bs) = ef_aux (x+b) a bs
         ef_aux x a (ParaTras b:bs) = ef_aux (x-b) a bs
         ef_aux x a (Escreva b:bs) = ef_aux x (escreve x b a) bs