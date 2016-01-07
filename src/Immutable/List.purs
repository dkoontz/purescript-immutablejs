module Immutable.List
  ( List(..)
  , create
  , size
  , push
  , setAt
  , filterNot
  ) where

import Prelude
import Data.Function

foreign import data List :: * -> *

foreign import create :: forall t. Array t -> List t
foreign import size :: forall t. List t -> Number

push :: forall t. t -> List t -> List t
push = runFn2 _push
foreign import _push :: forall t. Fn2 t (List t) (List t)

setAt :: forall t. Int -> t -> List t -> List t
setAt = runFn3 _set
foreign import _set :: forall t. Fn3 Int t (List t) (List t)

filterNot :: forall t. (t -> Boolean) -> List t -> List t
filterNot = runFn2 _filterNot
foreign import _filterNot :: forall t. Fn2 (t -> Boolean) (List t) (List t)
