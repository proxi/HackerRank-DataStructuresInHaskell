module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "SparseArrays/input_sample.txt"
        "SparseArrays/output_sample.txt"
        Main.main
    ]
    