module Main where

import HelloWorld

main :: IO ()
main = do
    putStrLn "running server... press Ctl-C to stop"
    run
