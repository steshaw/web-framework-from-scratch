#!/usr/bin/env stack
-- stack script --resolver lts-8.8 --package base

import Control.Exception.Base (bracket)
import Debug.Trace (trace)

-- | Our dummy requests and responses.
data Request = Request
data Response = Response

-- |
--
-- Assume this datatype is hidden from application code.
-- The idea is that the only way to construct a value of this type
-- is via the "callback" function. This means that 'App's will be
-- forced to use the "callback" function to have the correct type.
--
data ResponseReceived = ResponseReceived

-- | Our dummy resource.
data SomeResource = SomeResource

-- | Our modified @App@ type.
type App = Request -> (Response -> IO ResponseReceived) -> IO ResponseReceived

runApp :: App -> IO ()
runApp app = do
  app Request $ \ response ->
    case response of
      Response -> do
        putStrLn "Sending response"
        return ResponseReceived
  return ()

-- | This app is _forced_ to call 'cb'.
myBadApp :: App
myBadApp _request cb = do
  putStrLn "Responding to request"
  cb (trace "EVALUATING RESPONSE" Response)

main :: IO ()
main = runApp myBadApp
