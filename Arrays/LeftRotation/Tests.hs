module Tests (main) where

import qualified Main
import Test.Tasty
import Test.Utils

main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "Arrays/LeftRotation/input_sample.txt"
        "Arrays/LeftRotation/output_sample.txt"
        Main.main
    ]
