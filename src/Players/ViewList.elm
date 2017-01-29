module Players.ViewList exposing (view)

import Html exposing (Html, button, div, i, input, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Players.Messages exposing (Msg(NavigateToPlayerDetail))
import Players.Models exposing (Player, PlayerId)


view : List Player -> Html Msg
view players =
    div []
        [ nav players
        , list players
        ]


nav : List Player -> Html Msg
nav players =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Players" ] ]


list : List Player -> Html Msg
list players =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Level" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map playerRow players)
            ]
        ]


playerRow : Player -> Html Msg
playerRow player =
    tr []
        [ td [] [ text player.id ]
        , td [] [ text player.name ]
        , td [] [ text (toString player.level) ]
        , td []
            [ editPlayerButton player.id ]
        ]


editPlayerButton : PlayerId -> Html Msg
editPlayerButton playerId =
    button
        [ class "btn regular"
        , onClick (NavigateToPlayerDetail playerId)
        ]
        [ i [ class "fa fa-pencil mr1" ] []
        , text "Edit"
        ]
