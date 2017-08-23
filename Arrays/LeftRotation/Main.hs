import Data.Array.IArray

main :: IO ()
main = do
    [n, d] <- (map read . words) <$> getLine
    a <- (map read . words) <$> getLine
    let arr = listArray (0, n - 1) a :: Array Int Int
    putStrLn $ unwords $ map (show . (\i -> arr ! ((i + d) `mod` n))) $ range $ bounds arr
