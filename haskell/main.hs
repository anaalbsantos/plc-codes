{- Defina uma função que calcula o máximo entre 
3 valores e uma função para ver quantos são iguais -}
maxiThree :: Int -> Int -> Int -> Int
maxiThree m n p = max (max m n) p 

equalCount :: Int -> Int -> Int -> Int -> Int
equalCount x m n p
    | x == m && x == n && x == p = 3
    | x == m && x == n = 2
    | x == m && x == p = 2
    | x == p && x == n = 2
    | otherwise = 1


{- Defina uma função que, dado um valor inteiro s e
um número de semanas n, retorna quantas
semanas de 0 a n tiveram vendas iguais a s. Para
resolver esta questão, primeiro construa uma
definição simples para vendas. -}

vendas :: Int -> Int
vendas 0 = 10
vendas 1 = 20
vendas 2 = 30
vendas 3 = 20
vendas 4 = 50
vendas 5 = 60
vendas n = 50

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = totalVendas (n-1) + vendas n

maxVendas :: Int -> Int
maxVendas 0 = vendas 0
maxVendas n = max (maxVendas (n-1)) (vendas n)

semanasEqualx :: Int -> Int -> Int
semanasEqualx x n
    | n == -1 = 0
    | vendas n == x = 1 + semanasEqualx x (n-1)
    | otherwise = semanasEqualx x (n-1)

{- Defina uma função que, dado um número inteiro,
determina se ele é primo ou não. -}

isDivisible :: Int -> Int -> Bool
isDivisible x y = (mod x y == 0)

isPrime :: Int -> Bool
isPrime n
    | n == 2 = True
    | (n < 2 || (mod n 2 == 0 && n /= 2)) = False
    | otherwise = isPrimeAux n (n-1)
    where
        isPrimeAux x y
            | y == 2 = True -- quando y chega em 2, é pq não é divisível por nenhum antecessor
            | isDivisible x y = False
            | otherwise = isPrimeAux x (y-1)

{- Defina uma função que, dados dois números
inteiros x e y, determina se esses números
são primos entre si (o único divisor em comum 
é 1 ou MDC = 1). -}

isPrimeBetween :: Int -> Int -> Bool
isPrimeBetween x y
    | max x y == x = isPrimeBetweenAux x y (y-1) --se o maior for x, analiso todos os divisores de y e vejo se também divide x
    | otherwise = isPrimeBetweenAux y x (x-1)
    where
        isPrimeBetweenAux x y n
            | n == 1 = True
            | isDivisible y n && isDivisible x n = False
            | otherwise = isPrimeBetweenAux x y (n-1)


{- Defina um fatorial -}

fat :: Int -> Int
fat x
    | x == 1 = 1
    | otherwise = x * fat (x-1)

{- Defina uma função que compara se 4 números são iguais usando allEqual -}

allEqual :: Int -> Int -> Int -> Bool
allEqual x y z = (x == y) && (y == z)

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal x y z w = allEqual x y z && allEqual x y w

{- Escreva uma função para retornar, em forma de tabela,
todas as vendas da semana 0 até a semana n, incluindo
o total e a média de vendas no período. Usem as
funções definidas previamente e defina novas funções
que achar necessário. -}

addEspacos :: Int -> String
addEspacos n
    | n == 0 = ""
    | otherwise = " " ++ addEspacos (n-1)

paraDireita :: Int -> String -> String
paraDireita x str = addEspacos x ++ str

cabecalho :: String
cabecalho = "Semana  Vendas\n"

imprimeSemanas :: Int -> String
imprimeSemanas n
    | n == 0 = paraDireita 3 (show 0) ++ paraDireita 6 (show (vendas 0)) ++ "\n"
    | otherwise = imprimeSemanas (n-1) ++ paraDireita 3 (show n) ++ paraDireita 6 (show (vendas n)) ++ "\n"

imprimeTotal :: Int -> String
imprimeTotal n = "Total    " ++ show (totalVendas n) ++ "\n"

imprimeMedia :: Int -> String
imprimeMedia n = "Média   " ++ show ( fromIntegral (totalVendas n) / fromIntegral n) ++ "\n"

imprimeTabela :: Int -> IO()
imprimeTabela n = putStr (cabecalho
                  ++ imprimeSemanas n
                  ++ imprimeTotal n
                  ++ imprimeMedia n)
