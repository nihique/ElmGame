module Messages exposing (Msg(..))

import Players.Messages
import Players.Models exposing (Player)
import Http
import Navigation exposing (Location)


type Msg
    = NoOp
    | PlayersMsg Players.Messages.Msg
    | OnLocationChange Location
