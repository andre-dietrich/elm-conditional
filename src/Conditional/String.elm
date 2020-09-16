module Conditional.String exposing
    ( reverseIf, repeatIf, replaceIf
    , addIf, addWhen, attachIf, attachWhen
    , sliceIf, leftIf, rightIf, dropLeftIf, dropRightIf
    , consIf
    , toUpperIf, toLowerIf, padIf, padLeftIf, padRightIf, trimIf, trimLeftIf, trimRightIf
    , mapIf, filterIf
    )

{-| A collection of conditional functions to work with Strings.


# Strings

@docs reverseIf, repeatIf, replaceIf


# Building and Splitting

@docs addIf, addWhen, attachIf, attachWhen


# Get Substrings

@docs sliceIf, leftIf, rightIf, dropLeftIf, dropRightIf


# Char Conversions

@docs consIf


# Formatting

Cosmetic operations such as padding with extra characters or trimming whitespace.

@docs toUpperIf, toLowerIf, padIf, padLeftIf, padRightIf, trimIf, trimLeftIf, trimRightIf


# Higher-Order Functions

@docs mapIf, filterIf

-}

import Conditional
    exposing
        ( apply2If
        , apply2When
        , apply3If
        , applyIf
        )


{-| Add two Strings if the first parameter evalutes to True, otherwise the
second defines the result
-}
addIf : Bool -> String -> String -> String
addIf =
    apply2If (++)


{-| Add two Strings if the first one is not of type Nothing
-}
addWhen : Maybe String -> String -> String
addWhen =
    apply2When (++)


{-| Add the first String to the end of the second one, if the first parameter
evalutes to True.
-}
attachIf : Bool -> String -> String -> String
attachIf conditionMet a b =
    if conditionMet then
        b ++ a

    else
        b


{-| Add the first String to the end of the second one, if it is not of
type Nothing.
-}
attachWhen : Maybe String -> String -> String
attachWhen a b =
    case a of
        Just a_ ->
            b ++ a_

        _ ->
            b


{-| Apply String.reverse if the first condition is met.
-}
reverseIf : Bool -> String -> String
reverseIf =
    applyIf String.reverse


{-| Apply String.repeat if the first condition is met.
-}
repeatIf : Bool -> Int -> String -> String
repeatIf =
    apply2If String.repeat


{-| Apply String.replace if the first condition is met.
-}
replaceIf : Bool -> String -> String -> String -> String
replaceIf =
    apply3If String.replace


{-| Apply String.slice if the first condition is met.
-}
sliceIf : Bool -> Int -> Int -> String -> String
sliceIf =
    apply3If String.slice


{-| Apply String.left if the first condition is met.
-}
leftIf : Bool -> Int -> String -> String
leftIf =
    apply2If String.left


{-| Apply String.right if the first condition is met.
-}
rightIf : Bool -> Int -> String -> String
rightIf =
    apply2If String.right


{-| Apply String.dropLeft if the first condition is met.
-}
dropLeftIf : Bool -> Int -> String -> String
dropLeftIf =
    apply2If String.dropLeft


{-| Apply String.dropRight if the first condition is met.
-}
dropRightIf : Bool -> Int -> String -> String
dropRightIf =
    apply2If String.dropRight


{-| Apply String.cons if the first condition is met.
-}
consIf : Bool -> Char -> String -> String
consIf =
    apply2If String.cons


{-| Apply String.toUpper if the first condition is met.
-}
toUpperIf : Bool -> String -> String
toUpperIf =
    applyIf String.toUpper


{-| Apply String.toLower if the first condition is met.
-}
toLowerIf : Bool -> String -> String
toLowerIf =
    applyIf String.toLower


{-| Apply String.pad if the first condition is met.
-}
padIf : Bool -> Int -> Char -> String -> String
padIf =
    apply3If String.pad


{-| Apply String.padLeft if the first condition is met.
-}
padLeftIf : Bool -> Int -> Char -> String -> String
padLeftIf =
    apply3If String.padLeft


{-| Apply String.padRight if the first condition is met.
-}
padRightIf : Bool -> Int -> Char -> String -> String
padRightIf =
    apply3If String.padRight


{-| Apply String.trim if the first condition is met.
-}
trimIf : Bool -> String -> String
trimIf =
    applyIf String.trim


{-| Apply String.trimLeft if the first condition is met.
-}
trimLeftIf : Bool -> String -> String
trimLeftIf =
    applyIf String.trimLeft


{-| Apply String.trimRight if the first condition is met.
-}
trimRightIf : Bool -> String -> String
trimRightIf =
    applyIf String.trimRight


{-| Apply String.map if the first condition is met.
-}
mapIf : Bool -> (Char -> Char) -> String -> String
mapIf =
    apply2If String.map


{-| Apply String.filter if the first condition is met.
-}
filterIf : Bool -> (Char -> Bool) -> String -> String
filterIf =
    apply2If String.filter
