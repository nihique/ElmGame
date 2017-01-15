module View exposing (view)

import Model exposing (Model)
import Messages exposing (Msg)
import Html exposing (Html, div, program, text)


view : Model -> Html Msg
view model =
    div [] [ text model ]
