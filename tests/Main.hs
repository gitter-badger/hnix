module Main where

import qualified EvalTests
import qualified NixLanguageTests
import qualified ParserTests
import qualified PrettyTests
import           System.Environment
import           Test.Tasty

main :: IO ()
main = do
  nixLanguageTests <- NixLanguageTests.genTests
  runLangTests <- lookupEnv "LANGUAGE_TESTS"
  defaultMain $ testGroup "hnix" $
    [ ParserTests.tests
    , EvalTests.tests
    , PrettyTests.tests
    ] ++
    [ nixLanguageTests | runLangTests == Just "yes"  ]
