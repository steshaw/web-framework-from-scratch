#!/usr/bin/env stack
-- stack script --resolver lts-8.8 --package base

import Control.Exception.Base (bracket)
import System.IO (IOMode(ReadMode), openFile, hClose, hGetContents)

main = do
  cs <- bracket (openFile "tmp.txt" ReadMode)
                hClose
                hGetContents
  putStrLn cs
