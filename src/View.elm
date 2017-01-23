module View exposing (view)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Html exposing (Html, div, program, text)
import Players.Models exposing (PlayerId)
import Players.ViewList
import Players.ViewEdit
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div [] [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        PlayersRoute ->
            Html.map PlayersMsg (Players.ViewList.view model.players)

        PlayerRoute playerId ->
            playerPage model playerId

        NotFoundRoute ->
            viewNotFound


playerPage : Model -> PlayerId -> Html Msg
playerPage model playerId =
    let
        player =
            model.players
                |> List.filter (\a -> a.id == playerId)
                |> List.head
    in
        case player of
            Just player ->
                Html.map PlayersMsg (Players.ViewEdit.view player)

            Nothing ->
                viewNotFound


viewNotFound : Html msg
viewNotFound =
    div [] [ text "Not found" ]
