module Messages exposing (Msg(..))

import Players.Messages
import Players.Models exposing (Player)
import Http


type Msg
    = NoOp
    | PlayersMsg Players.Messages.Msg
