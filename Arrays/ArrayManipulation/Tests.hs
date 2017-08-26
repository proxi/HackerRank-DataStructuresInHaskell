module Tests (main) where
    
    import qualified Main
    import Test.Tasty
    import Test.Utils
    
    main :: IO ()
    main = do
        defaultMain $ testGroup "Tests" [
            goldenVsSample
                "Arrays/ArrayManipulation/input_sample.txt"
                "Arrays/ArrayManipulation/output_sample.txt"
                Main.main,
            goldenVsSample
                "Arrays/ArrayManipulation/input07.txt"
                "Arrays/ArrayManipulation/output07.txt"
                Main.main
            ]
        return ()
    