module Test.Main where

import Prelude
import Control.Monad.Eff
-- import Control.Monad.Eff.Console

import Data.Maybe
-- import Data.Array
import Data.Foldable
import Test.Unit
import Test.Unit.Console

-- import Immutable.Map as Map
-- import Immutable.Map(Map())
-- import Immutable.Record as Record
-- import Immutable.Record(Record())
import Immutable.List as List
import Immutable.List(List())

infixl 5 |>
(|>) :: forall t1 t2. t1 -> (t1 -> t2) -> t2
(|>) = flip ($)

emptyList :: List Int
emptyList = List.create []

threeElementList :: List Int
threeElementList = List.create [1, 2, 3]

hundredElementList :: List Int
hundredElementList = List.create [336482, 604573, 480269, 75207, 907213, 881497, 776254, 606417, 386046, 416393, 109970, 124129, 471129, 383989, 836044, 219355, 602021, 681306, 544998, 282855, 901916, 271274, 107227, 454389, 588366, 988206, 662406, 371613, 418402, 790726, 722949, 344420, 86566, 907594, 264680, 354209, 778960, 826006, 138141, 833238, 939401, 269111, 326092, 348283, 813453, 874905, 93536, 999127, 668912, 210899, 484287, 196596, 628404, 422756, 485030, 168925, 221760, 814956, 364190, 630790, 974387, 404327, 435071, 899656, 564670, 699773, 973647, 619708, 10140, 840442, 406267, 147343, 137411, 817680, 170728, 131453, 365541, 652592, 443505, 905128, 537959, 998852, 630405, 929670, 582201, 71278, 804142, 239372, 120833, 569577, 602635, 371981, 552068, 714321, 551960, 568096, 533882, 29550, 631241, 38412]

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
main :: forall e. Eff (testOutput :: TestOutput | e) Unit
main = runTest do
  test "Immutable.List" do
    assert
      "Lists contain the same number of elements as the array they were created from" $
        [ List.size emptyList == 0
        , List.size threeElementList == 3
        , List.size hundredElementList == 100
        ]
        |> all (== true)
    assert
      "Push adds 1 element to the list at the end" $
      threeElementList
        |> List.push 99
        |> List.get 3
        |> fromMaybe 0
        |> (== 99)
