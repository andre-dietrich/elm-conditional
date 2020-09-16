module Conditional exposing
    ( applyIf, apply2If, apply3If
    , apply2When, apply3When
    )

{-| Base collection for executing functions conditionally or for dealing with
Maybe - Types.


# Conditional application

@docs applyIf, apply2If, apply3If


# Maybe application

@docs apply2When, apply3When

-}


{-| Apply the passed function only if the second parameter evalutes to True.
-}
applyIf : (a -> a) -> Bool -> a -> a
applyIf fn conditionMet =
    if conditionMet then
        fn

    else
        identity


{-| -}
apply2If : (a -> b -> b) -> Bool -> a -> b -> b
apply2If function conditionMet a b =
    if conditionMet then
        function a b

    else
        b


{-| -}
apply3If : (a -> b -> c -> c) -> Bool -> a -> b -> c -> c
apply3If function conditionMet a b c =
    if conditionMet then
        function a b c

    else
        c


{-| Apply the passed function only onto a value not equal to Nothing.
-}
apply2When : (a -> b -> b) -> Maybe a -> b -> b
apply2When function a b =
    case a of
        Just a_ ->
            function a_ b

        _ ->
            b


{-| -}
apply3When : (a -> b -> c -> c) -> Maybe a -> b -> c -> c
apply3When function a b c =
    case a of
        Just a_ ->
            function a_ b c

        _ ->
            c
