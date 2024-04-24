{-
TYPES

Int: precisão arbitrária
Integer: precisão infinita
Bool
Char
 - ord: transforma Char em Int (biblioteca Data.Char)
 - chr: transforma Int em Char
 - fromEnum
 - toEnum 
String
 - ++: concatenação de strings
 - (:) : concatena um char com uma string
 - show: transforma qulquer tipo em string
 - length: comprimento da string (de uma lista)
-}

import Data.Char

offset :: Int
offset = ord 'A' - ord 'a'

maiuscula :: Char -> Char
maiuscula ch = chr (ord ch + offset)

ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')
