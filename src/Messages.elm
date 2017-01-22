module Messages exposing (Msg(..))

import Players.Messages


type Msg
    = NoOp
    | PlayersMsg Players.Messages.Msg
