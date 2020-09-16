module Conditional.List exposing
    ( addIf, addWhen, attachIf, attachWhen
    , mapIf, filterIf, filterMapIf
    , reverseIf
    , appendIf, appendWhen, concatMapIf, intersperseIf
    , sortIf, sortByIf
    , takeIf, dropIf
    )

{-| A set of conditional functions for maipulating Lists.


# Create

@docs repeatIf, addIf, addWhen, attachIf, attachWhen


# Transform

@docs mapIf, indexedMapIf, filterIf, filterMapIf


# Utilities

@docs reverseIf


# Combine

@docs appendIf, appendWhen, concatMapIf, intersperseIf, mapIf


# Sort

@docs sortIf, sortByIf


# Deconstruct

@docs takeIf, dropIf

-}

import Conditional
    exposing
        ( apply2If
        , apply2When
        , applyIf
        )


{-| Add an element to the front of a List only if the first condition is
parameter evaluates to True.
-}
addIf : Bool -> a -> List a -> List a
addIf =
    apply2If (::)


{-| Add an element to the front of a List only if the value is not Nothing
-}
addWhen : Maybe a -> List a -> List a
addWhen =
    apply2When (::)


{-| Perform a List.append only if the first condition is met, otherwise the
second List defines the result.
-}
appendIf : Bool -> List a -> List a -> List a
appendIf =
    apply2If List.append


{-| Perform a List.append only if the first parameter is not Nothing.
-}
appendWhen : Maybe (List a) -> List a -> List a
appendWhen =
    apply2When List.append


{-| Conditional application of a mapping function.
-}
mapIf : Bool -> (a -> a) -> List a -> List a
mapIf =
    apply2If List.map


{-| Conditional application of a filtering.
-}
filterIf : Bool -> (a -> Bool) -> List a -> List a
filterIf =
    apply2If List.filter


{-| Conditional application of a filterMap function.
-}
filterMapIf : Bool -> (a -> Maybe a) -> List a -> List a
filterMapIf =
    apply2If List.filterMap


{-| Conditional list reverse.
-}
reverseIf : Bool -> List a -> List a
reverseIf =
    applyIf List.reverse


{-| Conditional concatMap.
-}
concatMapIf : Bool -> (a -> List a) -> List a -> List a
concatMapIf =
    apply2If List.concatMap


{-| Conditional application of intersperse.
-}
intersperseIf : Bool -> a -> List a -> List a
intersperseIf =
    apply2If List.intersperse


{-| Conditional sort.
-}
sortIf : Bool -> List comparable -> List comparable
sortIf =
    applyIf List.sort


{-| Conditional sortBy.
-}
sortByIf : Bool -> (a -> comparable) -> List a -> List a
sortByIf =
    apply2If List.sortBy


{-| Conditional application of List.take.
-}
takeIf : Bool -> Int -> List a -> List a
takeIf =
    apply2If List.take


{-| Conditional application of List.drop.
-}
dropIf : Bool -> Int -> List a -> List a
dropIf =
    apply2If List.drop


{-| Add an element to the end of a List, if the first parameter evalutes to True.
-}
attachIf : Bool -> a -> List a -> List a
attachIf conditionMet value list =
    if conditionMet then
        List.append list [ value ]

    else
        list


{-| Add an element to the end of a List, if the element is not Nothing.
-}
attachWhen : Maybe a -> List a -> List a
attachWhen value list =
    case value of
        Just val ->
            List.append list [ val ]

        _ ->
            list
