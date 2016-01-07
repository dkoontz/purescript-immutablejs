module Test.Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.Maybe

import Immutable.Map(Map())
import Immutable.Map as Map

(|>) :: forall t1 t2. t1 -> (t1 -> t2) -> t2
(|>) = flip ($)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  Map.create { foo: "somefoovalue", bar: "somebarvalue" }
  |> Map.set "bar" "1234"
  |> Map.get "bar"
  |> fromMaybe "key not found"
  |> show
  |> log
