module SimpleLang.REPL
    ( repl
    ) where

import Control.Monad (forever)

import SimpleLang.Parser
import SimpleLang.Printer

-- Print error message or show AST as a string.
handle :: String -> IO ()
handle = either print (putStrLn . astToString) . parseExpr

-- Ask input and print valid ASTs.
repl :: IO ()
repl = forever $ do
    putStrLn "Type an arithmetic expression: "
    input <- getLine
    handle input
