module Tests (main) where
    
import qualified Main
import Test.Tasty
import Test.Utils
    
main :: IO ()
main = defaultMain $ testGroup "Tests" [
    goldenVsSample
        "SwapNodesAlgo/input00_sample.txt"
        "SwapNodesAlgo/output00_sample.txt"
        Main.main,
    goldenVsSample
        "SwapNodesAlgo/input01_sample.txt"
        "SwapNodesAlgo/output01_sample.txt"
        Main.main,
    goldenVsSample
        "SwapNodesAlgo/input02_sample.txt"
        "SwapNodesAlgo/output02_sample.txt"
        Main.main
    ]
