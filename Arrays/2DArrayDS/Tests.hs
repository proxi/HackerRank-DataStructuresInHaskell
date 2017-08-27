module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "2DArrayDS/input_sample.txt"
        "2DArrayDS/output_sample.txt"
        Main.main
    ]
