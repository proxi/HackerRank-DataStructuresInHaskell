module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "DynamicArray/input_sample.txt"
        "DynamicArray/output_sample.txt"
        Main.main
    , goldenVsSample
        "DynamicArray/input00.txt"
        "DynamicArray/output00.txt"
        Main.main
    ]
