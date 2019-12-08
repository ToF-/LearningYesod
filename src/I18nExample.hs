{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
module I18nExample where
import Data.Text (Text)
import qualified Data.Text as T
import Text.Hamlet (HtmlUrlI18n, ihamlet) 
import Text.Blaze.Html (toHtml)
import Text.Blaze.Html.Renderer.String (renderHtml)

data MyRoute = Home | Time | Stylesheet

renderUrl :: MyRoute -> [(Text, Text)] -> Text
renderUrl Home _ = "/home"
renderUrl Time _ = "/time"
renderUrl Stylesheet _ = "/style.css"

data Msg = Hello | Apples Int

renderEnglish :: Msg -> Text
renderEnglish Hello = "Hello"
renderEnglish (Apples 0) = "You did not buy any apples."
renderEnglish (Apples 1) = "You bought 1 apple."
renderEnglish (Apples i) = T.concat ["You bought ", T.pack $ show i, " apples."]

renderFrench :: Msg -> Text
renderFrench Hello = "Bonjour"
renderFrench (Apples 0) = "Vous n'avez pas acheté de pommes."
renderFrench (Apples 1) = "Vous avez acheté 1 pomme."
renderFrench (Apples i) = T.concat ["Vous avez acheté ", T.pack $ show i, " pommes."]

template :: Int -> HtmlUrlI18n Msg MyRoute 
template count = [ihamlet|
$doctype 5
<html>
    <head>
        <title>i18n
    <body>
        <h1>_{Hello}
        <p>_{Apples count}
|]

i18nExample :: IO ()
i18nExample = putStrLn $ renderHtml $ (template 5) (toHtml . renderFrench) renderUrl
