port module ModuleB exposing (main)

import Browser
import Html exposing (Html, a, text)
import Html.Events exposing (onClick)


port incomePort : (String -> msg) -> Sub msg


port outcomePort : String -> Cmd msg


type Msg
    = Save
    | Load String


type alias Model =
    { name : String
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Save ->
            ( model, outcomePort model.name )

        Load name ->
            ( { model | name = name }, Cmd.none )


view : Model -> Html Msg
view model =
    a [ onClick Save ] [ text ("ModuleB, name is: " ++ model.name) ]


type alias Flags =
    { name : String }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( Model flags.name, Cmd.none )


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> incomePort Load
        , view = view
        }
