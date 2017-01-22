module Update exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        PlayersMsg playersMsg ->
            let
                ( subModel, subCmd ) =
                    Players.Update.update playersMsg model.players
            in
                ( { model | players = subModel }, Cmd.map PlayersMsg subCmd )
