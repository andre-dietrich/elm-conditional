module Conditional.Array exposing
    ( setIf, setWhen, pushIf, pushWhen, appendIf, appendWhen
    , mapIf, filterIf, sliceIf
    )

{-| Conditional functions for array manipulation.


# Manipulate

@docs setIf, setWhen, pushIf, pushWhen, appendIf, appendWhen


# Transform

@docs mapIf, filterIf, sliceIf

-}

import Array exposing (Array)
import Conditional
    exposing
        ( apply2If
        , apply2When
        , apply3If
        , apply3When
        , applyIf
        )


{-| Set the element at a particular index if the condition is met. Returns an
updated array. If the index is out of range, the array is unaltered.

    Array.fromList [ 1, 2, 3 ]
        |> setIf False 1 7
        |> (==) Array.fromList [ 1, 2, 3 ]

-}
setIf : Bool -> Int -> a -> Array a -> Array a
setIf =
    apply3If Array.set


{-| Set the element at a particular index, if it is not of type Nothing.
If the index is out of range, the array is unaltered.

    setWhen 1 (Just 7) (Array.fromList [ 1, 2, 3 ]) == Array.fromList [ 1, 7, 3 ]

-}
setWhen : Int -> Maybe a -> Array a -> Array a
setWhen i =
    apply2When (Array.set i)


{-| Push an element onto the end of an array if the first value evalutes to True.

    pushIf False 3 (Array.fromList [ 1, 2 ]) == Array.fromList [ 1, 2 ]

-}
pushIf : Bool -> a -> Array a -> Array a
pushIf =
    apply2If Array.push


{-| Push an element onto the end of an array, if it is not of type Nothing.

    pushWhen (Just 3) (Array.fromList [ 1, 2 ]) == Array.fromList [ 1, 2, 3 ]

-}
pushWhen : Maybe a -> Array a -> Array a
pushWhen =
    apply2When Array.push


{-| Append the first array only if the first parameter evalutes to True.

    appendIf False (Array.repeat 2 42) (Array.repeat 3 81) == Array.fromList [ 81, 81, 81 ]

-}
appendIf : Bool -> Array a -> Array a -> Array a
appendIf =
    apply2If Array.append


{-| Append two arrays to a new one, if the first one is not of type Nothing.

    append Nothing (repeat 3 81) == fromList [ 81, 81, 81 ]

-}
appendWhen : Maybe (Array a) -> Array a -> Array a
appendWhen =
    apply2When Array.append


{-| Conditional slice that is only performed, if the first parameter evalutes
to True.
-}
sliceIf : Bool -> Int -> Int -> Array a -> Array a
sliceIf =
    apply3If Array.slice


{-| Conditional mapping that is only performed, if the first parameter evalutes
to True. The resulting array has to be of the same type as the input array.
-}
mapIf : Bool -> (a -> a) -> Array a -> Array a
mapIf =
    apply2If Array.map


{-| Conditional filtering that is only performed, if the first parameter evalutes
to True.
-}
filterIf : Bool -> (a -> Bool) -> Array a -> Array a
filterIf =
    apply2If Array.filter
