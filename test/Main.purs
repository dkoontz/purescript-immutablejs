module Test.Main where

import Effect (Effect)
import Prelude (Unit, bind)
import Test.List (list)
import Test.OrderedMap (orderedmap)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  list
  orderedmap
