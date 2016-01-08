module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

-- import Immutable.Map as Map
-- import Immutable.Map(Map())
-- import Immutable.Record as Record
-- import Immutable.Record(Record())

import Immutable.List as List
-- import Immutable.List(List())

(|>) :: forall t1 t2. t1 -> (t1 -> t2) -> t2
(|>) = flip ($)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  []
  |> List.create
  |> List.size
  |> show
  |> log
