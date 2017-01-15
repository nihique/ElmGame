module Models exposing (..)

import Messages exposing (Msg)


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Hello ElmGame", Cmd.none )
