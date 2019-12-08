{-# LANGUAGE QuasiQuotes, OverloadedStrings #-} 
module TextExample where
import Text.Shakespeare.Text
import qualified Data.Text.Lazy.IO as TLIO 
import Data.Text (Text)
import Control.Monad (forM_)


data Item = Item { itemName :: Text , itemQty :: Int }

items :: [Item] 
items =
    [ Item "apples" 5
    , Item "bananas" 10 ]

textExample :: IO ()
textExample = forM_ items $ \item -> TLIO.putStrLn
    [lt|You have #{show $ itemQty item} #{itemName item}.|]
