module Players.Commands exposing (fetchAll, changeLevel)

import Http exposing (Request, jsonBody)
import Json.Decode as Decode
import Json.Encode as Encode
import Players.Messages exposing (Msg(OnFetchAll, OnSave))
import Players.Models exposing (Player, PlayerId)


fetchAll : Cmd Msg
fetchAll =
    Http.get fetchAllUrl playersDecoder
        |> Http.send OnFetchAll


changeLevel : PlayerId -> Int -> List Player -> List (Cmd Msg)
changeLevel playerId howMuch players =
    let
        changeLevelCmd player =
            if player.id == playerId then
                save { player | level = player.level + howMuch }
            else
                Cmd.none
    in
        List.map changeLevelCmd players


save : Player -> Cmd Msg
save player =
    saveRequest player
        |> Http.send OnSave


saveRequest player =
    Http.request
        { method = "PATCH"
        , headers = []
        , url = saveUrl player.id
        , body = Http.jsonBody (playerEncoder player)
        , expect = Http.expectJson playerDecoder
        , timeout = Nothing
        , withCredentials = False
        }


saveUrl : PlayerId -> String
saveUrl playerId =
    "http://localhost:4000/players/" ++ playerId


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/players"


playerEncoder : Player -> Encode.Value
playerEncoder player =
    Encode.object
        [ ( "id", Encode.string player.id )
        , ( "name", Encode.string player.name )
        , ( "level", Encode.int player.level )
        ]


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
