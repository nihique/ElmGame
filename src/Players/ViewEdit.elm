module Players.ViewEdit exposing (view)

import Html exposing (Html, a, button, div, h1, i, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Players.Messages exposing (Msg(ChangeLevel, NavigateToPlayerList))
import Players.Models exposing (Player)


view : Player -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Player -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listPlayersButton ]


listPlayersButton : Html Msg
listPlayersButton =
    button
        [ onClick NavigateToPlayerList
        ]
        [ i
            [ class "fa fa-chevron-left mr1" ]
            []
        , text "Players"
        ]


form : Player -> Html Msg
form player =
    div [ class "m3" ]
        [ h1 [] [ text player.name ]
        , formLevel player
        ]


formLevel : Player -> Html Msg
formLevel player =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString player.level) ]
            , btnLevelDecrease player
            , btnLevelIncrease player
            ]
        ]


btnLevelDecrease : Player -> Html Msg
btnLevelDecrease player =
    a
        [ class "btn ml1 h1"
        , onClick (ChangeLevel player.id 1)
        ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnLevelIncrease : Player -> Html Msg
btnLevelIncrease player =
    a
        [ class "btn ml1 h1"
        , onClick (ChangeLevel player.id 1)
        ]
        [ i [ class "fa fa-plus-circle" ] [] ]
