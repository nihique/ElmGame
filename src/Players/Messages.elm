module Players.Messages exposing (..)

import Players.Models exposing (Player)
import Http


type Msg
    = NoOp
    | OnFetchAll (Result Http.Error (List Player))
