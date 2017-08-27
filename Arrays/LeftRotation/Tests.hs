module Tests (main) where

import qualified Main
import Test.Tasty
import Test.Utils

main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "LeftRotation/input_sample.txt"
        "LeftRotation/output_sample.txt"
        Main.main
    ]
