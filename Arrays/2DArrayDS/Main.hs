import Data.Array.IArray

hourglass :: (Int, Int) -> [(Int, Int)]
hourglass (row, col) = [(row - 1, col - 1), (row - 1, col), (row - 1, col + 1)] ++
                       [(row, col)] ++
                       [(row + 1, col - 1), (row + 1, col), (row + 1, col + 1)]

main :: IO ()
main = do
    a <- fmap (map read . words) getContents :: IO [Int]
    let arr = listArray ((0, 0), (5, 5)) a :: Array (Int, Int) Int
    let best = maximum $ map hourglassSum $ range ((1, 1), (4, 4)) where
        hourglassSum :: (Int, Int) -> Int
        hourglassSum idx = sum $ (map (\i -> arr ! i)) $ hourglass idx
    putStrLn $ show best
