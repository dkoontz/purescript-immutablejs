module Immutable.Map
( Map(..)
, create
, size
, set
, delete
, clear
, get
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



-- Reading values
get :: forall k v. k -> Map k v -> Maybe v
get = runFn2 _get
foreign import _get :: forall k v. Fn2 k (Map k v) (Maybe v)
