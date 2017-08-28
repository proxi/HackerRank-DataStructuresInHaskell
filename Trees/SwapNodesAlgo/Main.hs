import qualified Data.Map.Strict as Map
import Control.Monad

data Tree a = Empty | Tree a (Tree a) (Tree a) 

fromMap :: Map.Map Int (Int, Int) -> Tree Int
fromMap mp = node (1 :: Int) where
    node (-1) = Empty
    node i    = Tree i (node $ left i) (node $ right i) where
        left x = fst $ mp Map.! x
        right x = snd $ mp Map.! x

inOrder :: Tree Int -> [Bool] -> [Int]
inOrder Empty _ = []
inOrder (Tree a l r) (s:ss) =
    if s then inOrder r ss ++ [a] ++ inOrder l ss
         else inOrder l ss ++ [a] ++ inOrder r ss

main :: IO ()
main = do
    n <- readLn
    lrs <- replicateM n $ (\[l, r] -> (l, r)) . map read . words <$> getLine :: IO [(Int, Int)]
    let treeMap = Map.fromList [(a, (l, r)) | (a, (l, r)) <- zip [1..n] lrs]
    let tree = fromMap treeMap

    q <- readLn
    ks <- replicateM q readLn :: IO [Int]
    foldM_ (step tree) (repeat False) ks where
        step tree ks k = do
            let qks = [n `mod` k == 0 | n <- [1..]]
            let nks = zipWith xor ks qks where xor a b = a /= b
            putStrLn $ unwords . map show $ inOrder tree nks
            return nks
