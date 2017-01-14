module Main exposing (..)

-- MODEL

import Html exposing (Html, div, program, text)


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Hello ElmGame", Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text model ]



-- MESSAGES


type Msg
    = NoneYet



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoneYet ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
