module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import PolishCounter exposing (polishCount)


main =
    Html.beginnerProgram { model = model, view = view, update = update }


stylesheet =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
            ]

        children =
            []
    in
        node tag attrs children



-- MODEL


type alias Model =
    { request : String
    , answer : Int
    }


model : Model
model =
    Model "" 0



-- UPDATE


type Msg
    = Count
    | Clear
    | Set String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Set request ->
            { model | request = request }

        Clear ->
            { model | request = "", answer = 0 }

        Count ->
            { model | answer = polishCount model.request }



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "outer", class "container" ]
        [ stylesheet
        , div [ id "inner", class "col-md-2 col-md-offset-5" ]
            [ input
                [ type_ "text"
                , placeholder "Enter your query"
                , value model.request
                , onInput Set
                ]
                []
            , div [] [ text <| "Answer: " ++ (toString model.answer) ]
            , button [ onClick Count ] [ text "Count" ]
            , button [ onClick Clear ] [ text "Clear" ]
            ]
        ]
