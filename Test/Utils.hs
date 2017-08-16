module Test.Utils (goldenVsSample) where

import System.IO
import Test.Tasty
import Test.Tasty.Golden.Advanced
import GHC.IO.Handle
import System.IO.Silently
import Text.Printf

runTestCase :: FilePath -> IO () -> IO String
runTestCase inputPath f = do
    hInput <- openFile inputPath ReadMode
    hDuplicateTo hInput stdin
    (actualOutput, _) <- capture f
    return actualOutput

goldenVsSample :: FilePath -> FilePath -> IO () -> TestTree
goldenVsSample input ref act =
    goldenTest
        input
        (System.IO.readFile ref)
        (runTestCase input act)
        cmp
        upd
      where
      cmp x y = simpleCmp msg x y
        where
        msg = printf "Test output was different from '%s'. It was: %s" ref (show y)
      upd = System.IO.writeFile ref

simpleCmp :: String -> String -> String -> IO (Maybe String)
simpleCmp e x y =
    return $ if words x == words y then Nothing else Just e
