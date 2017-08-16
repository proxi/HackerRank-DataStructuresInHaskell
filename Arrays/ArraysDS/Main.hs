import Data.Array.IArray

main :: IO ()
main = do
    n <- fmap read getLine
    a <- fmap (map read . words) getLine
    let arr = listArray (1, n) a :: Array Int Int
    putStrLn $ unwords $ map (show . (\i -> arr ! i)) $ reverse . range $ bounds arr
