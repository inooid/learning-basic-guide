import Browser
import Html exposing (Html, button, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main =
  Browser.sandbox { init = init, update = update, view = view }

-- Model
type alias State = String

init : State
init = ""

-- Update
type Action = UpdateInput String

update : Action -> State -> State
update action model =
  case action of
    UpdateInput str -> str

-- View
view : State -> Html Action
view model =
  div [attribute "bob" "ross"]
    [
      input [placeholder "Add your awesome text hereee!! WOOO", value model, onInput UpdateInput] []
    , div [] [ text model ]
    ]
