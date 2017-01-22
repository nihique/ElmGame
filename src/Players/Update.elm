module Players.Update exposing (..)

import Players.Messages exposing (Msg(NoOp))


update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
