port module ModuleA exposing (main)

import Html exposing (text)
import Platform.Sub as Sub

port incomePort : (String -> msg) -> Sub msg

main =
  text "Hello"
