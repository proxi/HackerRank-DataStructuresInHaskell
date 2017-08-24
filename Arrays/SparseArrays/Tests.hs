module Tests (main) where
    
    import qualified Main
    import Test.Tasty
    import Test.Utils
    
    main :: IO ()
    main = defaultMain $ testGroup "Tests" [
        goldenVsSample
            "Arrays/SparseArrays/input_sample.txt"
            "Arrays/SparseArrays/output_sample.txt"
            Main.main
        ]
    