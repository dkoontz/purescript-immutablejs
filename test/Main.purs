module Test.Main where

import Prelude (Unit)
import Test.Unit.Console (TESTOUTPUT)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Test.List (list)
import Test.Unit.Main (runTest)

type TestEffects = (console :: CONSOLE , testOutput :: TESTOUTPUT , avar :: AVAR)

main :: Eff TestEffects Unit
main = runTest do
  list
