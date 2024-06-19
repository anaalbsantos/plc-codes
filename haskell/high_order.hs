--Funções de Alta Ordem
--recebem outras funções como argumento ou resultado

applyTwice :: (a -> a) -> a -> a
applyTwice f x  = f (f x)

maisUm :: Int -> Int
maisUm x = x + 1

--total de qualquer função
total f n 
    | n == 0 = f n
    | otherwise = total f (n-1) + f n

--máximo de qualquer função
maxFun :: (Int -> Int) -> Int -> Int
maxFun f n
    | n == 0 = f n
    | otherwise = max (f n) (maxFun f (n-1))

--verificar se uma função é crescente
isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f n
    | n == 0 = True
    | f n <= f (n-1) = False
    | otherwise = isCrescent f (n-1)

function :: Int -> Int
function x = -2*x

double :: [Int] -> [Int]
double [] = []
double (a:xs) = (2*a) : double xs

{- ---- MAPEAMENTO ---- -}

-- map: aplica uma função a todo elemento de uma lista
maps f [] = []
maps f (a:as) = f a : maps f as

-- fold: realiza uma operação entre os elementos de uma lista
foldr1_ :: (t -> t -> t) -> [t] -> t
foldr1_ f [a] = a                       -- funciona apenas com listas que possuem pelo menos 1 elemento
foldr1_ f (a:as) = f a (foldr1_ f as)

foldr_ :: (t -. u -> u) -> u -> [t] -> u
foldr_ f s [] = s                        -- s indica o elemento neutro da função quando a lista é vazia 
foldr_ f s (a:as) = f a (foldr_ f s as)

-- filter: filtragem de lista
filter_ p l = [a | a <- l, p a] 
