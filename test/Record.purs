module Tests.Record where

import Prelude
-- import Data.Foldable
-- import Data.Maybe
-- import Data.Array
import Test.Unit

-- import Immutable.Utils
import Immutable.Record as Record
import Immutable.Record(Record(), Accessor(..))

import Tests.Utils

type TestFields = ( first :: Int, second :: Boolean, third :: String )
type TestRecord = Record TestFields

testValues :: Object TestFields
testValues = { first: 99, second: false, third: "string value" }

testRecord :: Record TestFields
testRecord = Record.create testValues

first :: forall r v. Accessor (first :: v | r) v
first = Accessor "first"

recordTests :: TestCaseResult
recordTests = do
  test "Immutable.Record" do
    recordCreationTests
    recordAccessorTests

recordCreationTests :: AssertResult
recordCreationTests = do
  let record :: TestRecord
      record = Record.create { first: 5, second: true, third: "Test" }
  assert
    -- if this compiles then the test is validated
    "Immutable Record is created from a regular Purescript record" true

recordAccessorTests :: AssertResult
recordAccessorTests = do
  assert
    "Getter return value in the record the record was created with" $
    Record.get first testRecord == testValues.first

  assert
    "Setter returns a new record with the specified field updated" $
    Record.get first (Record.set first 5 testRecord) == 5
    && Record.get first testRecord == testValues.first
