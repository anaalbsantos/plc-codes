main = do
 a <- getLine
 let result = alturaArvore (read a::Tree Int)
 print result

data Tree t = Node t (Tree t) (Tree t) 
               | Nilt
               deriving (Read)

alturaArvore :: Tree t -> Int
alturaArvore Nilt = 0
alturaArvore (Node value left right) = (max x y) + 1
   where x = alturaArvore left
         y = alturaArvore right


-- internalNodes :: Tree t -> [t]
-- internalNodes Nilt = []
-- internalNodes (Node value left right) = 
--     value : internalNodes left ++ internalNodes right

-- -- Função principal para testar
-- main :: IO ()
-- main = do
--     -- Exemplo de árvore
--     let tree = Node 1 (Node 2 Nilt (Node 3 Nilt Nilt)) (Node 4 Nilt Nilt)
--     print $ internalNodes tree