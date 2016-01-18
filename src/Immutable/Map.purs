module Immutable.Map
( Map(..)
, create
, size
-- Persistent changes
, set
, delete
, clear
, update
, merge
-- , mergeWith
-- , mergeDeep
-- , mergeDeepWith
-- Deep persistent changes
-- , setIn
-- , deleteIn
-- , updateIn
-- , mergeIn
-- , mergeDeepIn,
-- Transient changes
-- , withMutations
-- Conversion to Seq
-- , toSeq
-- , toKeyedSeq
-- , toIndexedSeq
-- , toSetSeq
-- Value equality
-- , equals
-- , hashCode
-- Reading values
, get
, has
, includes
-- , first
-- , last
-- Reading deep values
-- , getIn
-- , hasIn
-- , toJS
-- , toArray
-- , toObject
-- , toMap
-- , toOrderedMap
-- , toSet
-- , toOrderedSet
-- , toList
-- , toStack
-- , keys
-- , values
-- , entries
-- , keySeq
-- , valueSeq
-- , entrySeq
, map
, filter
, filterNot
-- , reverse
-- , sort
-- , sortBy
-- , groupBy
-- , slice
-- , rest
-- , butLast
-- , skip
-- , skipLast
-- , skipWhile
-- , skipUntil
-- , take
-- , takeLast
-- , takeWhile
-- , takeUntil
-- , concat
-- , flatten
-- , flatMap
-- , reduce
-- , reduceRight
-- , every
-- , some
-- , join
-- , isEmpty
-- , count
-- , countBy
-- , find
-- , findLast
-- , findEntry
-- , findLastEntry
-- , max
-- , maxBy
-- , min
-- , minBy
-- , keyOf
-- , lastKeyOf
-- , findKey
-- , findLastKey
-- , isSubset
-- , isSuperset
-- , flip
-- , mapKeys
-- , mapEntries
) where

import Data.Function
import Data.Maybe

foreign import data Map :: * -> * -> *

-- Utility
foreign import create :: forall k v r. Object r -> Map k v
foreign import size :: forall k v. Map k v -> Number

-- Persistent changes
set :: forall k v. k -> v -> Map k v -> Map k v
set = runFn3 _set
foreign import _set :: forall k v. Fn3 k v (Map k v) (Map k v)

delete :: forall k v. k -> Map k v -> Map k v
delete = runFn2 _delete
foreign import _delete :: forall k v. Fn2 k (Map k v) (Map k v)

clear :: forall k v. Map k v -> Map k v
clear = runFn1 _clear
foreign import _clear :: forall k v. Fn1 (Map k v) (Map k v)

update :: forall k v. k -> (v -> v) -> Map k v -> Map k v
update = runFn3 _update
foreign import _update :: forall k v. Fn3 k (v -> v) (Map k v) (Map k v)

merge :: forall k v. Map k v -> Map k v -> Map k v
merge = runFn2 _merge
foreign import _merge :: forall k v. Fn2 (Map k v) (Map k v) (Map k v)

-- Reading values
get :: forall k v. k -> Map k v -> Maybe v
get = runFn2 _get
foreign import _get :: forall k v. Fn2 k (Map k v) (Maybe v)

has :: forall k v. k -> Map k v -> Boolean
has = runFn2 _has
foreign import _has :: forall k v. Fn2 k (Map k v) Boolean

includes :: forall k v. v -> Map k v -> Boolean
includes = runFn2 _includes
foreign import _includes :: forall k v. Fn2 v (Map k v) Boolean

map :: forall k v. (v -> v) -> Map k v -> Map k v
map = runFn2 _map
foreign import _map :: forall k v. Fn2 (v -> v) (Map k v) (Map k v)

filter :: forall k v. (v -> Boolean) -> Map k v -> Map k v
filter = runFn2 _filter
foreign import _filter :: forall k v. Fn2 (v -> Boolean) (Map k v) (Map k v)

filterNot :: forall k v. (v -> Boolean) -> Map k v -> Map k v
filterNot = runFn2 _filter
foreign import _filterNot :: forall k v. Fn2 (v -> Boolean) (Map k v) (Map k v)
