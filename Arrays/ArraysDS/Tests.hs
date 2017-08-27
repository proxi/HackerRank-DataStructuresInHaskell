module Tests (main) where

import qualified Main
import Test.Tasty
import Test.Utils

main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "ArraysDS/input_sample.txt"
        "ArraysDS/output_sample.txt"
        Main.main
    ]
