module ChildParent.Widget exposing (..)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type_)
import Html.Events exposing (onClick)

type alias Model =
    { count : int }

initialModel : Model
initialModel =
    { count = 1 }


type Msg
    = Increment
    | Decrement

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment
            -> { model | count = model.count + 1 }

        Decrement
            -> { model | count = model.count - 1 }


view : Model -> Html Msg
view model =
    div
        []
        [ text model.count
        , input [ type_ "button" onClick Decrement ] [ text "Decrement" ]
        , input [ type_ "button" onClick Increment ] [ text "Increment" ]
        ]




