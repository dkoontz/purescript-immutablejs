module Test.List where

import Data.Array (length)
import Data.Maybe (fromMaybe)
import Immutable.List (get, push, List, create, size)
import Prelude ((<$>), (-), bind, discard)
import Test.QuickCheck ((===), Result)
import Test.Unit (suite, TestSuite, test)
import Test.Unit.QuickCheck (quickCheck)

creationKeepsAmountOfElements :: Array Int -> Result
creationKeepsAmountOfElements arr = length arr === size (create arr)

pushAddsAnElement :: List Int -> Int -> Result
pushAddsAnElement l i =
  let pushed = (push i l)
      s = size pushed
      gotten = fromMaybe 0 (get (s - 1) pushed)
   in gotten === i

list :: TestSuite
list = suite "Immutable.List" do
  test "Lists contain the same number of elements as the array they were created from"
    (quickCheck creationKeepsAmountOfElements)
  test "Push adds 1 element to the list at the end"
    (quickCheck pushAddsAnElement)
