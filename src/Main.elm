module Main exposing (..)

import Html exposing (program)
import Messages exposing (Msg)
import Models exposing (Model, init)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)


-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
