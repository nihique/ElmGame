module ChildParent.Main exposing (..)

import Html exposing (Html, div, h1, h2, input, label, program, text)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onInput)
import ChildParent.Widget as Widget


-- MAIN


main : Program Never Model Msg
main =
    program
        { init = ( initialModel, Cmd.none )
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



-- MODEL


type alias Model =
    { heading : String
    , widgetModel : Widget.Model
    }


initialModel : Model
initialModel =
    { heading = "Parent heading"
    , widgetModel = Widget.initialModel
    }



-- UPDATE


type Msg
    = SetHeading String
    | WidgetMsg Widget.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetHeading value ->
            ( { model | heading = value }, Cmd.none )

        WidgetMsg subMsg ->
            let
                ( widgetModel, widgetMsg ) =
                    Widget.update subMsg model.widgetModel
            in
                ( { model | widgetModel = widgetModel }, Cmd.map WidgetMsg widgetMsg )



-- VIEW


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Component Architecture" ]
        , h2 [] [ text model.heading ]
        , div
            []
            [ label [] [ text "Heading: " ]
            , input
                [ type_ "text"
                , value model.heading
                , onInput SetHeading
                ]
                []
            ]
        , div
            []
            [ Html.map WidgetMsg (Widget.view model.widgetModel)
            ]
        ]
