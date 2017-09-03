module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "MaximumElement/input_sample.txt"
        "MaximumElement/output_sample.txt"
        Main.main
    ]
