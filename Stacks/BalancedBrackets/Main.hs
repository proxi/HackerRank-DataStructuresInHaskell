import Control.Monad

invert :: Char -> Char
invert ')' = '('
invert '}' = '{'
invert ']' = '['

isBalanced :: String -> Bool
isBalanced xs' = balance xs' [] where
    balance [] [] = True
    balance [] _ = False
    balance (x:xs) [] | x `elem` "({[" = balance xs [x]
                      | otherwise = False
    balance (x:xs) (s:ss) | x `elem` "({[" = balance xs (x:s:ss)
                          | invert x == s = balance xs ss
                          | otherwise = False

main :: IO ()
main = do
    n <- readLn
    replicateM_ n $ getLine >>= (\s -> putStrLn $ if isBalanced s then "YES" else "NO")
