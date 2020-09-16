module Conditional.Dict exposing
    ( insertIf, insertWhen, insertWhenValue, updateIf, updateWhen, updateWhenValue, removeIf, removeWhen
    , mapIf, filterIf
    , unionIf, intersectIf
    )

{-| A collection of conditional functions for maipulating dictionaries


# Build

@docs insertIf, insertWhen, insertWhenValue, updateIf, updateWhen, updateWhenValue, removeIf, removeWhen


# Transform

@docs mapIf, filterIf


# Combine

@docs unionIf, intersectIf

-}

import Conditional
    exposing
        ( apply2If
        , apply2When
        , apply3If
        , apply3When
        )
import Dict exposing (Dict)


{-| Conditional dict insertion
-}
insertIf : Bool -> comparable -> v -> Dict comparable v -> Dict comparable v
insertIf =
    apply3If Dict.insert


{-| Insert into dict, if the key is not Nothing
-}
insertWhen : Maybe comparable -> v -> Dict comparable v -> Dict comparable v
insertWhen =
    apply3When Dict.insert


{-| Insert into dict, if the value is not Nothing
-}
insertWhenValue : comparable -> Maybe v -> Dict comparable v -> Dict comparable v
insertWhenValue key =
    apply2When (Dict.insert key)


{-| Conditional dict update
-}
updateIf : Bool -> comparable -> (Maybe v -> Maybe v) -> Dict comparable v -> Dict comparable v
updateIf =
    apply3If Dict.update


{-| Update dict, if the key is not Nothing
-}
updateWhen : Maybe comparable -> (Maybe v -> Maybe v) -> Dict comparable v -> Dict comparable v
updateWhen =
    apply3When Dict.update


{-| Update dict, if the value is not Nothing
-}
updateWhenValue : comparable -> Maybe (Maybe v -> Maybe v) -> Dict comparable v -> Dict comparable v
updateWhenValue key =
    apply2When (Dict.update key)


{-| Conditional dict removal
-}
removeIf : Bool -> comparable -> Dict comparable v -> Dict comparable v
removeIf =
    apply2If Dict.remove


{-| Remove an entry from a dict, if the key is not Nothing
-}
removeWhen : Maybe comparable -> Dict comparable v -> Dict comparable v
removeWhen =
    apply2When Dict.remove


{-| Apply the mapping function only if the first parameter evalutes to True.
-}
mapIf : Bool -> (k -> a -> a) -> Dict k a -> Dict k a
mapIf =
    apply2If Dict.map


{-| Conditional filtering.
-}
filterIf : Bool -> (comparable -> v -> Bool) -> Dict comparable v -> Dict comparable v
filterIf =
    apply2If Dict.filter


{-| If the first parameter evalutes to True, then both Dicts are unified,
otherwise the second Dict defines the result
-}
unionIf : Bool -> Dict comparable v -> Dict comparable v -> Dict comparable v
unionIf =
    apply2If Dict.union


{-| Conditional intersection.
-}
intersectIf : Bool -> Dict comparable v -> Dict comparable v -> Dict comparable v
intersectIf =
    apply2If Dict.intersect
