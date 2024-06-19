main = do
 a <- getLine
 b <- getLine
 let result = faces (read a) (read b)
 print result

data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | East | South | West
                 deriving (Read, Show)

checkDirection :: Command -> Direction -> Direction
checkDirection (Forward _) x = x
checkDirection (Backward _) x = x
checkDirection (TurnLeft) x = case x of
                                 North -> West
                                 East -> North
                                 South -> East
                                 West -> South
checkDirection (TurnRight) x = case x of
                                 North -> East
                                 East -> South
                                 South -> West
                                 West -> North



faces :: Direction -> [Command] -> Direction
faces dir [] = dir
faces dir (a:as) = faces (checkDirection a dir) as