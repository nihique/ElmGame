module Players.Update exposing (..)

import Players.Messages exposing (Msg(..))
import Navigation exposing (newUrl)


update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OnFetchAll (Ok players) ->
            ( players, Cmd.none )

        OnFetchAll (Err error) ->
            ( model, Cmd.none )

        NavigateToPlayerList ->
            ( model, newUrl ("#players") )

        NavigateToPlayerDetail playerId ->
            ( model, newUrl ("#players/" ++ playerId) )
