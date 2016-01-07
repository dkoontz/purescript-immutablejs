module Immutable.Record
  ( Record(..)
  , Accessor(..)
  , create
  , get
  , set
  ) where

import Prelude
import Data.Function

foreign import data Record :: # * -> *
newtype Accessor (r :: # *) v = Accessor String

get :: forall r v. Accessor r v -> Record r -> v
get (Accessor fieldName) record = unsafeGetProperty fieldName record

set :: forall r v. Accessor r v -> v -> Record r -> Record r
set (Accessor fieldName) value record = unsafeSetProperty fieldName value record

foreign import create :: forall t. Object t -> Record t

unsafeGetProperty :: forall r v. String -> Record r -> v
unsafeGetProperty = runFn2 _unsafeGetProperty
foreign import _unsafeGetProperty :: forall r v. Fn2 String (Record r) v

unsafeSetProperty :: forall r v. String -> v -> Record r -> Record r
unsafeSetProperty = runFn3 _unsafeSetProperty
foreign import _unsafeSetProperty :: forall r v. Fn3 String v (Record r) (Record r)
