module Models exposing (..)

import Messages exposing (Msg)
import Players.Models exposing (Player)


type alias Model =
    { players : List Player
    }


initialModel : Model
initialModel =
    { players = [ Player "1" "Johnny" 3, Player "2" "Angelina" 2 ]
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )
