{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
module CassiusExample where

import Text.Hamlet (HtmlUrl, hamlet)
import Text.Cassius (cassius,renderCss,CssUrl)
import Text.Blaze.Html.Renderer.String (renderHtml) 
import Data.Text (Text)

data MyRoute = Home
render :: MyRoute -> [(Text, Text)] -> Text
render Home _ = "/home"

cassiusExample :: IO ()
cassiusExample = putStrLn $ renderHtml $ [hamlet|
some text
|] render

style :: CssUrl MyRoute
style = [cassius|
.page-title
  border: 1px solid red
  background: gray
  color: blue
|]
