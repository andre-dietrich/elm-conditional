module Conditional.Bitwise exposing
    ( andIf, orIf, xorIf, complementIf
    , shiftLeftByIf, shiftRightByIf, shiftRightZfByIf
    )

{-| Library for Conditional [bitwise operations](https://en.wikipedia.org/wiki/Bitwise_operation).


# Basic Operations

@docs andIf, orIf, xorIf, complementIf


# Bit Shifts

@docs shiftLeftByIf, shiftRightByIf, shiftRightZfByIf

-}

import Bitwise
import Conditional exposing (apply2If, applyIf)


{-| Conditional bitwise AND
-}
andIf : Bool -> Int -> Int -> Int
andIf =
    apply2If Bitwise.and


{-| Conditional bitwise OR
-}
orIf : Bool -> Int -> Int -> Int
orIf =
    apply2If Bitwise.or


{-| Conditional bitwise XOR
-}
xorIf : Bool -> Int -> Int -> Int
xorIf =
    apply2If Bitwise.xor


{-| Conditional bitwise complement
-}
complementIf : Bool -> Int -> Int
complementIf =
    applyIf Bitwise.complement


{-| Conditional bitwise shiftLeftBy
-}
shiftLeftByIf : Bool -> Int -> Int -> Int
shiftLeftByIf =
    apply2If Bitwise.shiftLeftBy


{-| Conditional bitwise shiftRightBy
-}
shiftRightByIf : Bool -> Int -> Int -> Int
shiftRightByIf =
    apply2If Bitwise.shiftRightBy


{-| Conditional bitwise shiftRightZfBy
-}
shiftRightZfByIf : Bool -> Int -> Int -> Int
shiftRightZfByIf =
    apply2If Bitwise.shiftRightZfBy
