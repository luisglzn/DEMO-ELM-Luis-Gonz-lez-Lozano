module Test.Generated.Main exposing (main)

import Example

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 325332677028621
        , processes = 12
        , globs =
            []
        , paths =
            [ "C:\\Users\\luisg\\OneDrive\\Escritorio\\Demo-ELM\\tests\\Example.elm"
            ]
        }
        [ ( "Example"
          , [ Test.Runner.Node.check Example.suite
            ]
          )
        ]