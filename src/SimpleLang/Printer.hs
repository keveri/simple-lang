module SimpleLang.Printer
    ( astToString
    ) where

import Data.Tree
import Data.Tree.Pretty

import SimpleLang.Syntax

-- Helper for building a tree.
toNode :: Expr -> (String, [Expr])
toNode (Num n) = (show n, [])
toNode ((:+) e1 e2) = ("(+)", [e1,e2])
toNode ((:-) e1 e2) = ("(-)", [e1,e2])
toNode ((:*) e1 e2) = ("(*)", [e1,e2])
toNode ((:/) e1 e2) = ("(/)", [e1,e2])

-- Show the AST as a pretty tree stucture.
astToString :: Expr -> String
astToString = drawVerticalTree . unfoldTree toNode
