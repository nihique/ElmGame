module Players.Update exposing (..)

import Players.Messages exposing (Msg(..))


update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OnFetchAll (Ok players) ->
            ( players, Cmd.none )

        OnFetchAll (Err error) ->
            ( model, Cmd.none )
