main = do
 a <- getLine
 let result = executa (read a)
 print result

type Comando = String
type Valor = Int

results :: [(Comando, Valor)] -> Int -> Int
results [] x = x
results ((a,b):as) x = case a of
                        "Soma" -> results (as) (x + b)
                        "Subtrai" -> results (as) (x - b)
                        "Multiplica" -> results (as) (x * b)
                        "Divide" -> case b of
                                       0 -> -666
                                       _ -> results (as) (x `div` b)

executa :: [(Comando, Valor)] -> Int
executa [] = 0
executa (a:as) = results (a:as) 0