module Main exposing (main)

import Messages exposing (Msg(OnLocationChange, PlayersMsg))
import Models exposing (Model, initialModel)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)
import Navigation exposing (Location)
import Players.Commands exposing (fetchAll)


-- MAIN


initialCommand : Cmd Msg
initialCommand =
    Cmd.map PlayersMsg fetchAll


init : Location -> ( Model, Cmd Msg )
init location =
    let
        ( updatedModel, cmd ) =
            update (OnLocationChange location) initialModel
    in
        ( updatedModel, initialCommand )


main : Program Never Model Msg
main =
    Navigation.program
        OnLocationChange
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
