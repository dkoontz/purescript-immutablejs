module Tests.Utils where

import Prelude
import Control.Monad.Eff
import Control.Monad.Except.Trans
import Control.Monad.Cont.Trans
import Test.Unit.Console

-- infixl 5 |>
-- (|>) :: forall t1 t2. t1 -> (t1 -> t2) -> t2
-- (|>) = flip ($)

type TestCaseResult = forall e. ExceptT String (ContT Unit (Eff ( testOutput :: TestOutput | e ))) Unit
type AssertResult = forall e. ExceptT String (ContT Unit (Eff e)) Unit
