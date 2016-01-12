module Immutable.Utils where

infixl 5 |>
(|>) :: forall t1 t2. t1 -> (t1 -> t2) -> t2
(|>) v f = f v
