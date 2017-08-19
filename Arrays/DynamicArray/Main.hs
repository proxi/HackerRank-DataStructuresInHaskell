import Control.Monad
import Data.Array.IO
import Data.Bits
import Data.IORef
import Data.Sequence

ints :: String -> [Int]
ints = map (read :: String -> Int) . words

main :: IO ()
main = do
    [n, q] <- fmap (map (read :: String -> Int) . words) getLine :: IO [Int]
    qs <- fmap (map ints . lines) getContents :: IO [[Int]]
    seqList <- newListArray (0, n - 1) $ Prelude.replicate n empty :: IO (IOArray Int (Seq Int))
    lastAnswer <- newIORef 0
    forM_ qs $ \[t, x, y] -> do
        la <- readIORef lastAnswer
        let seqIndex = (x `xor` la) `mod` n
        seq <- readArray seqList seqIndex
        case t of
            1 -> do
                writeArray seqList seqIndex $ seq |> y
                return ()
            2 -> do
                let nl = seq `Data.Sequence.index` (y `mod` Data.Sequence.length seq)
                writeIORef lastAnswer nl
                print nl
                return ()
        return ()
    return ()
