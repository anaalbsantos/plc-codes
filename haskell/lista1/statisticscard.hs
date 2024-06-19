main = do
    a <- getLine
    let result = selectValues a
    print result

selectString :: String -> (String,String)
selectString [] = ([], [])
selectString (a:as)
    | a == ';' = ([], as)
    | otherwise = ([a] ++ x, y)
        where (x, y) = selectString as

selectData :: String -> Int -> ([String], String)
selectData [] n = ([], [])
selectData (a:as) n
    | n == 2 = ([x], y)
    | otherwise = selectData y (n+1)
        where (x,y) = selectString (a:as)

selectValues :: String -> [String]
selectValues [] = []
selectValues (a:as) = x ++ selectValues y
    where (x,y) = selectData (a:as) 0

transform :: [String] -> [Double]
transform [] = []
transform (a:as) = [read a] ++ transform as

minElement :: [Double] -> Double
minElement [] = 0
minElement [x] = x
minElement (a:as) = min a (minElement as)

maxElement :: [Double] -> Double
maxElement [] = 0
maxElement [x] = x
maxElement (a:as) = max a (maxElement as)

minMaxCartao :: String -> (Double, Double)
minMaxCartao [] = (0,0)
minMaxCartao (a:as) = (minElement (b:bs), maxElement (b:bs))
    where (b:bs) = transform (selectValues (a:as))
