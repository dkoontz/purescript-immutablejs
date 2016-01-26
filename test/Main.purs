module Test.Main where

import Prelude
import Control.Monad.Eff
-- import Control.Monad.Eff.Console

-- import Data.Array
import Test.Unit
import Test.Unit.Console
-- import Immutable.Utils

-- import Immutable.Map as Map
-- import Immutable.Map(Map())
-- import Immutable.Record as Record
-- import Immutable.Record(Record())
-- import Immutable.List as List
-- import Immutable.List(List())

import Tests.List
import Tests.Record

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
main :: forall e. Eff (testOutput :: TestOutput | e) Unit
main = runTest do
  listTests
  recordTests
