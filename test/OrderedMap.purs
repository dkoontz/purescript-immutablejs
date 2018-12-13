module Test.OrderedMap where

import Data.Foldable (foldl)
import Data.Maybe (Maybe(Just))
import Data.Traversable (traverse)
import Data.Tuple (Tuple(Tuple))
import Immutable.OrderedMap (setmut, withMutations, set, fromRecord, get)
import Prelude -- ((&&), unit, pure, (==), show, (<>), bind)
import Test.QuickCheck ((<?>), Result, (===))
import Test.Unit (test, suite)
import Test.Unit.QuickCheck (quickCheck)

constructorEmpty :: Int -> String -> Result
constructorEmpty i s =
  let om' = fromRecord {}
      om = set i s om'
      gotten = get i om
   in gotten == Just s <?> ("Property not holding for key " <> show i <> " and value " <> s)

doWithMutations :: Array (Tuple Int String) -> Result
doWithMutations arr =
  let om' = fromRecord {}
      mutate = \m -> void $ traverse (\(Tuple k v) -> setmut k v m) arr
      om = withMutations om' mutate
   in foldl (\sum (Tuple k v) -> sum && ((get k om) == (Just v))) true arr
      <?> "Failed for arr: " <> show arr

orderedmap = suite "Immutable.OrderedMap" do
  test "should be constructable from empty record"
    (quickCheck constructorEmpty)
  test "should work with mutations"
    (quickCheck doWithMutations)
