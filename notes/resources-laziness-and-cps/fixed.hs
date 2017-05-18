#!/usr/bin/env stack
-- stack script --resolver lts-8.8 --package base

import Control.Exception.Base (bracket)
import Debug.Trace (trace)

-- | Our dummy requests and responses.
data Request = Request
data Response = Response

-- | Our dummy resource.
data SomeResource = SomeResource

-- | Our modified @App@ type.
type App = Request -> (Response -> IO ()) -> IO ()

runApp :: App -> IO ()
runApp app = do
  app Request $ \ response ->
    case response of
      Response -> putStrLn "Sending response"

myApp :: App
myApp _request cb = bracket createResource destroyResource respond
  where
    createResource = do
      putStrLn "Creating resource"
      return SomeResource
    destroyResource _ = do
      putStrLn "Destroying resource"
    respond SomeResource = do
      putStrLn "Responding to request" -- A new print statement
      cb (trace "EVALUATING RESPONSE" Response)

main :: IO ()
main = runApp myApp
