# Project Name

This is a Purescript interface to the Facebook Immutable.js library.

## Installation

`npm install purescript-immutablejs`

## Usage

### Records
```purescript
import Immutable.Record as Record -- import all functions as Record.xyz
import Immutable.Record(Record()) -- import the Record type into the current module

type TestRecord = Record ( first :: Int, second :: Boolean, third :: String )

testRecord :: TestRecord
testRecord = Record.create { first: 5, second: true, third: "I can see my house from here" }
```

Defining a type for your Record isn't strictly necessary, you could write the above as

```purescript
testRecord = Record.create { first: 5, second: true, third: "I can see my house from here" }
```

To get or set a value from a record use an Accessor.

```purescript
import Immutable.Record as Record
import Immutable.Record(Record(), Accessor())

-- Here are 3 accessors, each one defines a field that must exist in the
-- Record's rows. The types encoded in the accessor allow the get/set
-- functions to determine the correct types on a per-record basis.
first :: forall r v. Accessor (first :: v | r) v
first = Accessor "first"

second :: forall r v. Accessor (second :: v | r) v
second = Accessor "second"

third :: forall r v. Accessor (third :: v | r) v
third = Accessor "third"

-- get is the function that retrieves a value out of the record, it uses
-- the string that you set in the accessor as the key
firstValue :: Int
firstValue = Record.get first testRecord

secondValue :: Boolean
secondValue = Record.get second testRecord

thirdValue :: String
thirdValue = Record.get third testRecord

-- set is the function that creates a new record with the specified
-- field modified to be the provided value
newRecord = Record.set first 9 testRecord
-- this fails with a type error because testRecord's 'first' field
-- is of type Int not String
newRecord' = Record.set first "Yo" testRecord
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

My sincerest thanks to [Nathan Faubion](https://gist.github.com/natefaubion) for developing the Accessor type for Record access and teaching me about phantom types.

## License

See the LICENSE file
