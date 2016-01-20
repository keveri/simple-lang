module SimpleLang.Syntax
    ( Expr (..)
    ) where

data Expr = Num Double
          | (:+) Expr Expr
          | (:-) Expr Expr
          | (:*) Expr Expr
          | (:/) Expr Expr
