module Immutable.IRecord
  ( IRecord(..)
  , Accessor(..)
  , makeRecord
  , get
  , set
  ) where

import Data.Function.Uncurried (runFn3, Fn3, Fn2, runFn2)

foreign import data IRecord :: # * -> *
newtype Accessor (r :: # *) v = Accessor String

get :: forall r v. Accessor r v -> IRecord r -> v
get (Accessor fieldName) record = unsafeGetProperty fieldName record

set :: forall r v. Accessor r v -> v -> IRecord r -> IRecord r
set (Accessor fieldName) value record = unsafeSetProperty fieldName value record

foreign import makeRecord :: forall t. Record t -> IRecord t

unsafeGetProperty :: forall r v. String -> IRecord r -> v
unsafeGetProperty = runFn2 _unsafeGetProperty
foreign import _unsafeGetProperty :: forall r v. Fn2 String (IRecord r) v

unsafeSetProperty :: forall r v. String -> v -> IRecord r -> IRecord r
unsafeSetProperty = runFn3 _unsafeSetProperty
foreign import _unsafeSetProperty :: forall r v. Fn3 String v (IRecord r) (IRecord r)
