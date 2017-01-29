module Players.Messages exposing (..)

import Players.Models exposing (Player, PlayerId)
import Http


type Msg
    = NoOp
    | OnFetchAll (Result Http.Error (List Player))
    | NavigateToPlayerList
    | NavigateToPlayerDetail PlayerId
