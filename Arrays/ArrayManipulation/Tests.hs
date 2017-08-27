module Tests (main) where
    
    import qualified Main
    import Test.Tasty
    import Test.Utils
    
    main :: IO ()
    main = defaultMain $ testGroup "Tests" [
        goldenVsSample
            "ArrayManipulation/input_sample.txt"
            "ArrayManipulation/output_sample.txt"
            Main.main,
        goldenVsSample
            "ArrayManipulation/input07.txt"
            "ArrayManipulation/output07.txt"
            Main.main
        ]
    