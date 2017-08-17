module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = do
    defaultMain $ goldenVsSample
        "Arrays/2DArrayDS/input_sample.txt"
        "Arrays/2DArrayDS/output_sample.txt"
        Main.main
    return ()
