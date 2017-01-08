module ChildParent.Main exposing (..)

import Html exposing (Html, div, h1, h2, input, label, program, text)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onInput)


main : Program Never Model Msg
main =
    program
        { init = ( initialModel, initialCommand )
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Model =
    { heading : String
    }


initialModel : Model
initialModel =
    { heading = "Parent heading"
    }


initialCommand : Cmd Msg
initialCommand =
    Cmd.none


type Msg
    = SetHeading String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetHeading value ->
            ( { model | heading = value }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Component Architecture" ]
        , h2 [] [ text model.heading ]
        , div []
            [ label [] [ text "Heading: " ]
            , input
                [ type_ "text"
                , value model.heading
                , onInput SetHeading
                ]
                []
            ]
        ]
