module Immutable.OrderedMap
( OrderedMap(..)
, fromRecord
, size
, set
, delete
, clear
, get
, withMutations
, setmut
) where

import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2, Fn3, runFn3)
import Data.Maybe (Maybe)
import Immutable.Mut (MUT)
import Prelude (Unit)

foreign import data OrderedMap :: * -> * -> *

-- Utility
foreign import fromRecord :: forall k v r. Record r -> OrderedMap k v
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

withMutations ::
  forall k v. OrderedMap k v
              -> (OrderedMap k v -> Eff (mut :: MUT) Unit)
              -> OrderedMap k v
withMutations = runFn2 _withMutations
foreign import _withMutations ::
  forall k v. Fn2 (OrderedMap k v)
                  (OrderedMap k v -> Eff (mut :: MUT) Unit)
                  (OrderedMap k v)

setmut :: forall k v. k -> v -> OrderedMap k v -> Eff (mut :: MUT) Unit
setmut = runFn3 _setmut
foreign import _setmut
  :: forall k v. Fn3 k v (OrderedMap k v) (Eff (mut :: MUT) Unit)

