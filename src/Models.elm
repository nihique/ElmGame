module Models exposing (Model, initialModel)

import Players.Models exposing (Player)
import Routing exposing (Route(PlayersRoute))


type alias Model =
    { players : List Player
    , route : Route
    }


initialModel : Model
initialModel =
    { players = []
    , route = PlayersRoute
    }
