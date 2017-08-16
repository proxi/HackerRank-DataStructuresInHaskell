module Tests (main) where

import qualified Main
import Test.Tasty
import Test.Utils

main :: IO ()
main = do
    defaultMain $ goldenVsSample "Arrays/ArraysDS/input_sample.txt" "Arrays/ArraysDS/output_sample.txt" Main.main
    return ()
