module Conditional.Set exposing
    ( insertIf, insertWhen, removeIf, removeWhen
    , unionIf, intersectIf, diffIf
    , mapIf, filterIf
    )

{-| A collection of conditional functions for working with sets.


# Build

@docs insertIf, insertWhen, removeIf, removeWhen


# Combine

@docs unionIf, intersectIf, diffIf


# Transform

@docs mapIf, filterIf

-}

import Conditional exposing (apply2If, apply2When)
import Set exposing (Set)


{-| Conditional insert
-}
insertIf : Bool -> comparable -> Set comparable -> Set comparable
insertIf =
    apply2If Set.insert


{-| Insert an element to a Set if it is not Nothing.
-}
insertWhen : Maybe comparable -> Set comparable -> Set comparable
insertWhen =
    apply2When Set.insert


{-| Conditional remove
-}
removeIf : Bool -> comparable -> Set comparable -> Set comparable
removeIf =
    apply2If Set.remove


{-| Remove an element to a Set if it is not Nothing.
-}
removeWhen : Maybe comparable -> Set comparable -> Set comparable
removeWhen =
    apply2When Set.remove


{-| Conditional union
-}
unionIf : Bool -> Set comparable -> Set comparable -> Set comparable
unionIf =
    apply2If Set.union


{-| Conditional intersection
-}
intersectIf : Bool -> Set comparable -> Set comparable -> Set comparable
intersectIf =
    apply2If Set.intersect


{-| Conditional diff
-}
diffIf : Bool -> Set comparable -> Set comparable -> Set comparable
diffIf =
    apply2If Set.diff


{-| Conditional map
-}
mapIf : Bool -> (comparable -> comparable) -> Set comparable -> Set comparable
mapIf =
    apply2If Set.map


{-| Conditional filter
-}
filterIf : Bool -> (comparable -> Bool) -> Set comparable -> Set comparable
filterIf =
    apply2If Set.filter
