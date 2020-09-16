module Conditional.Char exposing (..)

{-| A set of conditional functions for maipulating Chars


# Conversion

@docs toUpper, toLower, toLocaleUpper, toLocaleLower

-}

import Char
import Conditional exposing (applyIf)


{-| Convert to upper case if the first condition is met
-}
toUpperIf : Bool -> Char -> Char
toUpperIf =
    applyIf Char.toUpper


{-| Convert to lower case if the first condition is met
-}
toLowerIf : Bool -> Char -> Char
toLowerIf =
    applyIf Char.toLower


{-| Convert to locale upper case if the first condition is met
-}
toLocaleUpperIf : Bool -> Char -> Char
toLocaleUpperIf =
    applyIf Char.toLocaleUpper


{-| Convert to locale lower case if the first condition is met
-}
toLocaleLowerIf : Bool -> Char -> Char
toLocaleLowerIf =
    applyIf Char.toLocaleLower
