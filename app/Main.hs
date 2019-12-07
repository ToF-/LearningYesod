module Main where

import Links

main :: IO ()
main = do
    putStrLn "running server... press Ctl-C to stop"
    run
