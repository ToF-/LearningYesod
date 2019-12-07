{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses, 
             TemplateHaskell, OverloadedStrings #-}
module HelloWorld where
import Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes| 
/ HomeR GET
|]

instance Yesod HelloWorld

getHomeR :: Handler Html

getHomeR = defaultLayout [whamlet|Hello World!|]

run :: IO ()
run = warp 3000 HelloWorld
