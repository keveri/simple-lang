module SimpleLang.Lexer
    ( integer
    , float
    , parens
    , whiteSpace
    , reservedOp
    ) where

import           Text.Parsec.Language (emptyDef)
import           Text.Parsec.String   (Parser)
import qualified Text.Parsec.Token    as Tok

lexer :: Tok.TokenParser ()
lexer = Tok.makeTokenParser style
  where
    ops = ["+", "-", "*", "/"]
    style = emptyDef {
        Tok.reservedOpNames = ops
    }

integer :: Parser Integer
integer = Tok.integer lexer

float :: Parser Double
float = Tok.float lexer

parens :: Parser a -> Parser a
parens = Tok.parens lexer

whiteSpace :: Parser ()
whiteSpace = Tok.whiteSpace lexer

reservedOp :: String -> Parser ()
reservedOp = Tok.reservedOp lexer
