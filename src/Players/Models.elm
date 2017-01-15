module Players.Models exposing (..)


type alias Player =
    { playerId : Int
    , name : String
    , level : Int
    }


new : Player
new =
    Player ( 0, "", 1 )
