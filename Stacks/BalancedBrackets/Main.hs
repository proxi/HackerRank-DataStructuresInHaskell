import Control.Monad

isBalanced :: String -> Bool
isBalanced s = balance s [] where
    balance [] [] = True
    balance [] _ = False
    balance (x:xs) ss = case x of
        '(' -> balance xs (x:ss)
        '{' -> balance xs (x:ss)
        '[' -> balance xs (x:ss)
        ')' -> case ss of
            '(':ss -> balance xs ss
            _ -> False
        '}' -> case ss of
            '{':ss -> balance xs ss
            _ -> False
        ']' -> case ss of
            '[':ss -> balance xs ss
            _ -> False
            
main :: IO ()
main = do
    n <- readLn
    replicateM_ n $ getLine >>= (\s -> putStrLn $ if isBalanced s then "YES" else "NO")
