module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "BalancedBrackets/input_sample.txt"
        "BalancedBrackets/output_sample.txt"
        Main.main
    ]
