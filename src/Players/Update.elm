module Players.Update exposing (..)

import Players.Commands exposing (changeLevel)
import Players.Messages exposing (Msg(..))
import Navigation exposing (newUrl)
import Players.Models exposing (Player, PlayerId)


update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OnSave (Ok player) ->
            ( updatePlayer player model, Cmd.none )

        OnSave (Err error) ->
            ( model, Cmd.none )

        OnFetchAll (Ok players) ->
            ( players, Cmd.none )

        OnFetchAll (Err error) ->
            ( model, Cmd.none )

        NavigateToPlayerList ->
            ( model, newUrl ("#players") )

        NavigateToPlayerDetail playerId ->
            ( model, newUrl ("#players/" ++ playerId) )

        ChangeLevel playerId howMuch ->
            ( model, Cmd.batch (changeLevel playerId howMuch model) )


updatePlayer : Player -> List Player -> List Player
updatePlayer updatedPlayer players =
    let
        select existingPlayer =
            if existingPlayer.id == updatedPlayer.id then
                updatedPlayer
            else
                existingPlayer
    in
        List.map select players
