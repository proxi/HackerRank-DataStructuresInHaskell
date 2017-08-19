module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "Arrays/DynamicArray/input_sample.txt"
        "Arrays/DynamicArray/output_sample.txt"
        Main.main
    , goldenVsSample
        "Arrays/DynamicArray/input00.txt"
        "Arrays/DynamicArray/output00.txt"
        Main.main
    ]
