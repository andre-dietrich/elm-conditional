module Conditional.Result exposing
    ( mapIf
    , andThenIf
    )

{-| A collection of conditional function that can be applied to Result types.


# Common Helpers

@docs mapIf


# Chaining Results

@docs andThenIf

-}

import Conditional exposing (apply2If)


{-| Apply the mapping function only if the first condition is met.
-}
mapIf : Bool -> (a -> a) -> Result x a -> Result x a
mapIf =
    apply2If Result.map


{-| Apply a "Then" - chaining function only if the first condition is met.
-}
andThenIf : Bool -> (a -> Result x a) -> Result x a -> Result x a
andThenIf =
    apply2If Result.andThen
