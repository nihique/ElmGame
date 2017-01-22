module View exposing (view)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Html exposing (Html, div, program, text)
import Players.ViewList


view : Model -> Html Msg
view model =
    Html.map PlayersMsg (Players.ViewList.view model.players)
