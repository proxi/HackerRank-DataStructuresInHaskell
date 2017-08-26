{-# LANGUAGE BangPatterns #-}

import Control.Monad
import Data.Array.Unboxed
import Data.Array.ST
import Data.Maybe
import qualified Data.ByteString.Lazy.Char8 as BS
import Prelude hiding (words)

addArray :: (Num a1, Ix i, MArray a a1 m) => a i a1 -> i -> a1 -> m ()
addArray arr i e = do
    x <- readArray arr i
    writeArray arr i (x + e)
    return ()

words :: BS.ByteString -> [BS.ByteString]
words = BS.split ' '

readInts :: BS.ByteString -> [Int]
readInts l = map (fst . fromMaybe (0, undefined) . BS.readInt) (words l)

main :: IO ()
main = do
    (l:ls) <- BS.lines <$> BS.getContents
    let [n, m] = readInts l :: [Int]
    let qs = map readInts (take m ls) :: [[Int]]
    let arrx = runSTUArray $ do
            arr <- newArray (1, n) 0
            forM_ qs (\[a, b, k] -> do
                addArray arr a k
                when ((b + 1) <= n) $ addArray arr (b + 1) (-k)
                return ())
            forM_ [2..n] (\i -> do
                e <- readArray arr (i - 1)
                f <- readArray arr i
                writeArray arr i (e+f)
                return ())
            return arr
    print $ maximum $ map (\i -> arrx ! i) [1..n]
    return ()
