-- questão 1: Laziness
fibonacci :: [Int]
fibonacci = map fib [0 ..]

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- questão 2: merge de duas listas ordenadas
merge :: Ord t => [t] -> [t] -> [t]
merge [] [] = []
merge [] b = b
merge a [] = a
merge (a:as) (b:bs)
   | a > b = b : merge (a:as) bs
   | otherwise = a : merge as (b:bs)

type Pilha t = [t]
data Elemento = Valor Int | Soma | Multiplica deriving (Show)

exemploPilhaElem :: Pilha Elemento
exemploPilhaElem = [Valor 10, Valor 20, Soma, Valor 30, Multiplica]


geraString :: Pilha Elemento -> String
geraString [] = ""
geraString (Valor a:Valor b:Soma:as) = show a ++ "+" ++ show b ++ geraString as
geraString (Valor a:Valor b:Multiplica:as) = show a ++ "+" ++ show b



check :: Elemento -> Elemento -> Elemento -> Elemento
check (Valor a) (Valor b) Soma = Valor (a + b)
check (Valor a) (Valor b) Multiplica = Valor (a*b)

empilha :: Pilha Elemento -> Pilha Elemento
empilha [Valor x] = [Valor x]
empilha (a:as:as1:as2) = empilha (check a as as1 : as2)

calcula :: Pilha Elemento -> Int
calcula [] = 0
calcula (a:as) = x 
   where [Valor x] = empilha (a:as)