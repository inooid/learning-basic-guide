import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model = Int

init : Model
init =
  0


-- UPDATE

type Msg = Increment5 | Increment1 | Decrement1 | Decrement5

increment : Int -> Int -> Int
increment intToIncrement originalInt =
  originalInt + intToIncrement

decrement intToDecrement originalInt =
  originalInt - intToDecrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment5 ->
      increment 5 model

    Increment1 ->
      increment 1 model

    Decrement5 ->
      decrement 5 model

    Decrement1 ->
      decrement 1 model

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Increment5 ] [ text "+5" ]
    , button [ onClick Increment1 ] [ text "+1" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement1 ] [ text "-1" ]
    , button [ onClick Decrement5 ] [ text "-5" ]
    ]
