module Conditional.Maybe exposing
    ( mapIf
    , andThenIf
    )

{-| A collection of conditional functions that can be applied to Maybe types.


# Common Helpers

@docs mapIf


# Chaining Maybes

@docs andThenIf

-}

import Conditional exposing (apply2If)


{-| Apply the mapping function only if the first condition is met.
-}
mapIf : Bool -> (a -> a) -> Maybe a -> Maybe a
mapIf =
    apply2If Maybe.map


{-| Apply a "Then" - chaining function only if the first condition is met.
-}
andThenIf : Bool -> (a -> Maybe a) -> Maybe a -> Maybe a
andThenIf =
    apply2If Maybe.andThen
