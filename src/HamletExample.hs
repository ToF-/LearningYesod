-- Just ignore the quasiquote stuff for now, and that shamlet thing. -- It will be explained later.
{-# LANGUAGE QuasiQuotes #-}
module HamletExample where

import Text.Hamlet (shamlet)
import Text.Blaze.Html.Renderer.String (renderHtml) 
import Data.Char (toLower)
import Data.List (sort)

data Person = Person { name :: String , age :: Int }

hamletExample :: IO ()

hamletExample = putStrLn $ renderHtml [shamlet|
<p>Hello, my name is #{name person} and I am #{show $ age person}.
<p>
    Let's do some funny stuff with my name: #
    <b>#{sort $ map toLower (name person)}
<p>Oh, and in 5 years I'll be #{show (5 + (age person))} years old.
|]
   where
   person = Person "Michael" 26
