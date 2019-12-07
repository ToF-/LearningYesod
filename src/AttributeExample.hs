{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
module AttributeExample where

import Text.Hamlet (HtmlUrl, hamlet)
import Text.Blaze.Html.Renderer.String (renderHtml) 
import Data.Text (Text)

data MyRoute = Home
render :: MyRoute -> [(Text, Text)] -> Text
render Home _ = "/home"

colors :: [Text]
colors = ["black","purple","green","blue","red","orange"]

color :: Text
color = colors!!0

isChecked = True

isAdmin = False
isLoggedIn = False

maybeName :: Maybe Text
maybeName = Just "ToF"

data Person = Person { firstName :: String, lastName :: String}

maybePerson :: Maybe Person
maybePerson = Just $ Person "Christophe" "Thibaut"
attributeExample :: IO ()
attributeExample = putStrLn $ renderHtml $ [hamlet|
<body>
    <p style="color:#{color}">You can have interpolations within the attribute value.
    <input type=checkbox checked>input 
    <input type=checkbox :isChecked:checked>check box
    <p :isChecked:style="color:red">red if checked
    $if isAdmin
        <p>Welcome to the admin section.
    $elseif isLoggedIn
        <p>You are not the administrator.
    $else
        <p>I don't know who you are. Please log in so I can decide if you get access.
    $maybe name <- maybeName 
        <p>Your name is #{name}
    $nothing
        <p>I don't know your name.
    $maybe Person firstName lastName <- maybePerson 
        <p>Your name is #{firstName} #{lastName}
    $forall c <- colors
        <p style="color:#{c}>">This is the color #{c} 

|] render 
