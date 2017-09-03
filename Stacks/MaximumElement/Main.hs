import Control.Monad

newtype Stack = StackImpl [(Int, Int)]

empty :: Stack
empty = StackImpl []

push :: Stack -> Int -> Stack
push (StackImpl []) x = StackImpl [(x, x)]
push (StackImpl ((y, my):xs)) x = StackImpl ((x, Prelude.max x my):(y, my):xs)

pop :: Stack -> (Int, Stack)
pop (StackImpl ((x, _):xs)) = (x, StackImpl xs)

max :: Stack -> Int
max (StackImpl ((_, mx):_)) = mx

main :: IO ()
main = do
    n <- readLn
    qs <- replicateM n $ map read . words <$> getLine :: IO [[Int]]
    foldM_ (\s q -> case q of
            [1, x] -> return $ push s x
            [2]    -> return $ snd $ pop s
            [3]    -> print (Main.max s) >> return s
        ) empty qs
