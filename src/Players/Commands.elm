module Players.Commands exposing (fetchAll)

import Http exposing (Request)
import Json.Decode as Decode
import Players.Messages exposing (Msg(OnFetchAll))
import Players.Models exposing (Player)


fetchAll : Cmd Msg
fetchAll =
    Http.get fetchAllUrl playersDecoder
        |> Http.send OnFetchAll


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/players"


playersDecoder : Decode.Decoder (List Player)
playersDecoder =
    Decode.list playerDecoder


playerDecoder : Decode.Decoder Player
playerDecoder =
    Decode.map3
        Player
        (Decode.field "id" Decode.string)
        (Decode.field "name" Decode.string)
        (Decode.field "level" Decode.int)
