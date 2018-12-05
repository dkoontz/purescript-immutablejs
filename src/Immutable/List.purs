module Immutable.List
  ( List(..)
  , create
  , size
  -- Persistent changes
  , set
  , delete
  , clear
  , push
  , pop
  , unshift
  -- , shift
  -- , update
  -- , merge
  -- , mergeWith
  -- , mergeDeep
  -- , mergeDeepWith
  -- , setSize
  -- Deep persistent changes
  -- , setIn
  -- , deleteIn
  -- , updateIn
  -- , mergeIn
  -- , mergeDeepIn
  -- Transient changes
  -- , withMutations
  -- , asMutable
  -- Conversion to Seq
  -- , toSeq
  -- , toKeyedSeq
  -- , toIndexedSeq
  -- , toSetSeq
  -- , fromEntrySeq
  -- Value equality
  -- , equals
  -- , hashCode
  -- Reading values
  , get
  -- , has
  -- , includes
  , first
  , last
  -- Reading deep values
  -- , getIn
  -- , hasIn
  -- Conversion to Collections
  -- , toMap
  -- , toOrderedMap
  -- , toSet
  -- , toOrderedSet
  -- , toStack
  -- Sequence algorithms
  -- , map
  -- , filter
  , filterNot
  -- , reverse
  -- , sort
  -- , sortBy
  -- , groupBy
  -- Creating subsets
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
  -- Combination
  -- , concat
  -- , flatten
  -- , flatMap
  -- , interpose
  -- , interleve
  -- , splice
  -- , zip
  -- , zipWith
  -- Reducing a value
  -- , reduce
  -- , reduceRight
  -- , every
  -- , some
  -- , join
  -- , isEmpty
  -- , count
  -- , countBy
  -- Search for value
  -- , find
  -- , findLast
  -- , findEntry
  -- , findLastEntry
  -- , max
  -- , maxBy
  -- , min
  -- , minBy
  -- , indexOf
  -- , lastIndexOf
  -- , findIndex
  -- , findLastIndex
  -- Comparison
  -- , isSubset
  -- , isSuperset
  ) where


import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Data.Maybe (Maybe)
import Prelude ((<$>))
import Test.QuickCheck.Arbitrary (arbitrary, class Arbitrary)

foreign import data List :: Type -> Type

foreign import create :: forall t. Array t -> List t
foreign import size :: forall t. List t -> Int

-- Persistent changes

set :: forall t. Int -> t -> List t -> List t
set = runFn3 _set
foreign import _set :: forall t. Fn3 Int t (List t) (List t)

delete :: forall t. Int -> List t -> List t
delete = runFn2 _delete
foreign import _delete :: forall t. Fn2 Int (List t) (List t)

foreign import clear :: forall t. List t -> List t

push :: forall t. t -> List t -> List t
push = runFn2 _push
foreign import _push :: forall t. Fn2 t (List t) (List t)

foreign import pop :: forall t. List t -> List t

unshift :: forall t. Array t -> List t -> List t
unshift = runFn2 _unshift
foreign import _unshift :: forall t. Fn2 (Array t) (List t) (List t)

get :: forall t. Int -> List t -> Maybe t
get = runFn2 _get
foreign import _get :: forall t. Fn2 Int (List t) (Maybe t)

foreign import first :: forall t. List t -> Maybe t

foreign import last :: forall t. List t -> Maybe t

filterNot :: forall t. (t -> Boolean) -> List t -> List t
filterNot = runFn2 _filterNot
foreign import _filterNot :: forall t. Fn2 (t -> Boolean) (List t) (List t)

instance arbitaryList :: (Arbitrary a) => Arbitrary (List a) where
  arbitrary = create <$> arbitrary
