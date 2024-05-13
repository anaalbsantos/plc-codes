type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio","O Senhor dos Aneis"),
                ("Andre","Duna"),
                ("Fernando","Jonathan Strange & Mr.Norrell"),
                ("Fernando","Duna")]

--encontrar os livros de uma pessoa
--por compressão de lista
livros1 :: BancoDados -> Pessoa -> [Livro] 
livros1 bd pessoa = [snd x | x <- bd, fst x == pessoa]
--ou
-- livros1 bd pessoa = [lv | (p,lv) <- bd, p == pessoa]

--por filter
livros2 :: BancoDados -> Pessoa -> [Livro]
livros2 bd pessoa = map snd (filter isThisPerson bd) 
    where isThisPerson (p,l) = (p == pessoa)

emprestimos1 :: BancoDados -> Livro -> [Pessoa]
emprestimos1 bd lv = [ p | (p,l) <- bd, l == lv]

emprestimos2 :: BancoDados -> Livro -> [Pessoa]
emprestimos2 bd lv = map fst (filter (\(p,l) -> l == lv) bd)

emprestado :: BancoDados -> Livro -> Bool
emprestado bd lv = (emprestimos1 bd lv /= [])

qtdEmprestimos :: BancoDados-> Pessoa -> Int
qtdEmprestimos bd p = length (livros1 bd p)

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar bd p l = (p,l) : bd

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver bd p l = filter (\(p1,l1) -> (p1,l1) == (p,l)) bd