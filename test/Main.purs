module Test.Main where

import Effect (Effect)
import Prelude (Unit, discard)
import Test.List (list)
import Test.OrderedMap (orderedmap)
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  list
  orderedmap
