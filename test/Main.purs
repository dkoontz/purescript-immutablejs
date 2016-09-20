module Test.Main where

import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Random (RANDOM)
import Prelude (Unit, bind)
import Test.List (list)
import Test.OrderedMap (orderedmap)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

type TestEffects = (console :: CONSOLE , testOutput :: TESTOUTPUT , avar :: AVAR, random :: RANDOM)

main :: Eff TestEffects Unit
main = runTest do
  list
  orderedmap
