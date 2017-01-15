module Update exposing (update)

import Messages exposing (Msg(..))
import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoneYet ->
            ( model, Cmd.none )
