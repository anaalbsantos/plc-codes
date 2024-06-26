main = do
 s <- getLine
 let result = evalTree (read s)
 print result

data Ops = SUM | MUL | SUB
           deriving (Read)

data IntTree = Nilt Int |
               Node Ops IntTree IntTree
               deriving (Read)

evalTree :: IntTree -> Int
evalTree (Nilt x) = x
evalTree (Node SUM a b) = evalTree a + evalTree b
evalTree (Node MUL a b) = evalTree a * evalTree b
evalTree (Node SUB a b) = evalTree a - evalTree b
