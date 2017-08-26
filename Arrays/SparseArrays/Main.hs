import Control.Monad
import Control.Monad.State
import Data.Map.Strict as Map

type StringMap = Map.Map String Int

populate :: StateT StringMap IO ()
populate = do
    n <- liftIO $ read <$> getLine
    replicateM_ n $ do
        s <- liftIO getLine
        modify $ Map.insertWith (+) s 1
        return ()

main :: IO ()
main = do
    mp <- execStateT populate Map.empty
    q <- read <$> getLine
    replicateM_ q $ do
        s <- getLine
        print $ Map.findWithDefault 0 s mp
