module PolishCounter exposing (polishCount)

import String
import Debug


foldingFunc : String -> List Int -> List Int
foldingFunc x acc =
    let
        _ =
            Debug.log "foldingFunc" <| x ++ " " ++ toString acc
    in
        case acc of
            x1 :: x2 :: xs ->
                case x of
                    "+" ->
                        (x2 + x1) :: xs

                    "-" ->
                        (x2 - x1) :: xs

                    "*" ->
                        (x2 * x1) :: xs

                    _ ->
                        toInt_ x :: acc

            _ ->
                toInt_ x :: acc


toInt_ : String -> Int
toInt_ a =
    Result.withDefault 0 <| String.toInt a


polishCount : String -> Int
polishCount str =
    let
        p =
            String.split " " str

        res =
            List.foldl foldingFunc [] p
    in
        case res of
            [] ->
                0

            x :: _ ->
                x
