module Main exposing (..)

-- MODEL

import Html exposing (Html, div, program, text)


type Model
    = String


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


update : Msg Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoneYet ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
