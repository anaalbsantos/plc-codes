main = do
    a <- getLine
    b <- getLine
    let result = 0
    print result

selectString :: String -> (String,String)
selectString [] = ([], [])
selectString (a:as)
    | a == ';' = ([], as)
    | otherwise = ([a] ++ x, y)
        where (x, y) = selectString as

selectData :: String -> Int -> ([String], String)
selectData [] n = ([], [])
selectData (a:as) n = ([x],y)
        where (x,y) = selectString (a:as)

selectValues :: String -> [String]
selectValues [] = []
selectValues (a:as) = x ++ selectValues y
    where (x,y) = selectData (a:as) 0

check_filter :: String -> String -> Int -> Bool
check_filter [] [] n = False
check_filter [] comp n = False
check_filter (a:as) comp n
    | n < 3 = check_filter as comp(n+1)
    | otherwise = ((a:as) == comp)

next :: [String] -> [String]
next [] = []
next (a:as) = as

filter_ :: String -> [String] -> Int -> [String]
filter_ comp [] n = []
filter_ comp (a:as) n
    | mod n 3 == 0 && (check_filter a comp 0) = filter_ comp (next as) (n+2)
    | mod (n-2) 3 == 0 = [a] ++ (filter_ comp as (n+1))
    | otherwise = filter_ comp as (n+3)

transform :: [String] -> [Double]
transform [] = []
transform (a:as) = [read a] ++ transform as

logMes :: String -> String -> Double
logMes comp str = foldl (+) a as
    where (a:as) = transform (filter_ comp (selectValues str) 0)