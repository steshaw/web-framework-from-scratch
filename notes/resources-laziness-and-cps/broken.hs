#!/usr/bin/env stack
-- stack script --resolver lts-8.8 --package base

-- |
--
-- Exploring "Resources -- laziness and CPS".
-- <http://blog.infinitenegativeutility.com/2016/8/resources--laziness--and-continuation-passing-style>
--

import Control.Exception.Base (bracket)
import Debug.Trace (trace)

-- Our dummy requests and responses
data Request = Request
data Response = Response

-- Our dummy resource
data SomeResource = SomeResource

-- Our naive @App@ type
type App = Request -> IO Response

runApp :: App -> IO ()
runApp app = do
  response <- app Request
  case response of
    Response -> putStrLn "Sending response"

myApp :: App
myApp request = bracket createResource destroyResource respond
  where
    createResource = do
      putStrLn "Creating resource"
      return SomeResource
    destroyResource _ = do
      putStrLn "Destroying resource"
    respond SomeResource = do
      putStrLn "Responding to request" -- A new print statement
      return (trace "EVALUATING RESPONSE" Response)

main = runApp myApp
