module Models exposing (..)

import Messages exposing (Msg(PlayersMsg))
import Players.Models exposing (Player)
import Players.Commands exposing (fetchAll)


type alias Model =
    { players : List Player
    }


initialModel : Model
initialModel =
    { players = []
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.map PlayersMsg fetchAll )
