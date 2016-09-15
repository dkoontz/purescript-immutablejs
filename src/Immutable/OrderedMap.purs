module Immutable.OrderedMap
( OrderedMap(..)
, create
, size
, set
, delete
, clear
, get
) where

import Data.Function
import Data.Maybe

foreign import data OrderedMap :: * -> * -> *

-- Utility
foreign import create :: forall k v r. Object r -> OrderedMap k v
foreign import size :: forall k v. OrderedMap k v -> Number

-- Persistent changes
set :: forall k v. k -> v -> OrderedMap k v -> OrderedMap k v
set = runFn3 _set
foreign import _set :: forall k v. Fn3 k v (OrderedMap k v) (OrderedMap k v)

delete :: forall k v. k -> OrderedMap k v -> OrderedMap k v
delete = runFn2 _delete
foreign import _delete :: forall k v. Fn2 k (OrderedMap k v) (OrderedMap k v)

clear :: forall k v. OrderedMap k v -> OrderedMap k v
clear = runFn1 _clear
foreign import _clear :: forall k v. Fn1 (OrderedMap k v) (OrderedMap k v)



-- Reading values
get :: forall k v. k -> OrderedMap k v -> Maybe v
get = runFn2 _get
foreign import _get :: forall k v. Fn2 k (OrderedMap k v) (Maybe v)
