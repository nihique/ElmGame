module Main exposing (..)

import Players.Models exposing (PlayerId)
import UrlParser exposing (..)


type Routes
    = PlayersRoute
    | PlayerRoute PlayerId
    | NotFoundRoute


parser =
    UrlParser.oneOf
        [ map PlayersRoute top
        , map PlayersRoute (s "players")
        , map PlayerRoute (s "player" </> string)
        ]


parseLocation location =
    case (parseHash parser location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
