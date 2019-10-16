import Browser
import Html exposing (Html, button, div, text, input, label)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main =
  Browser.sandbox { init = init, update = update, view = view }

-- Model
type alias State =
  {
    name : String
  , password : String
  , passwordConfirmation : String
  }

init : State
init =
  State "" "" ""

-- Update
type Action
  = UpdateName String
  | UpdatePassword String
  | UpdatePasswordConfirmation String

update : Action -> State -> State
update action state =
  case action of
    UpdateName name ->
      { state | name = name }
    UpdatePassword password ->
      { state | password = password }
    UpdatePasswordConfirmation passwordConfirmation ->
      { state | passwordConfirmation = passwordConfirmation }

-- View
view : State -> Html Action
view state =
  div []
    [ div [] [viewInput "text" "Name" state.name UpdateName]
    , div [] [viewInput "password" "Password" state.password UpdatePassword]
    , div [] [viewInput "password" "Password confirmation" state.passwordConfirmation UpdatePasswordConfirmation]
    , div [style "paddingTop" "16px"]
      [ text "Is the form valid? "
      , viewValidator state
      ]
    ]

viewInput : String -> String -> String -> (String -> Action) -> Html Action
viewInput inputType labelText val updater =
  label []
  [ text (labelText ++ ":")
  , input [type_ inputType, placeholder ("Enter your " ++ String.toLower labelText ++ "..."), value val, onInput updater] []
  ]

viewValidator : State -> Html Action
viewValidator state =
    if List.any String.isEmpty [state.name, state.password] then
      div [] [text "Not all required fields are filled in"]

    else if state.password == state.passwordConfirmation then
      div [ style "color" "green" ] [ text "OK" ]

    else
      div [ style "color" "red" ] [ text "Passwords do not match!" ]
