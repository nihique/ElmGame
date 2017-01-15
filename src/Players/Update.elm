module Players.Update exposing (..)

import Players.Messages exposing (Msg(NoOp))


update model msg =
    case msg of
        NoOp ->
            ( model, Cmd.none )
