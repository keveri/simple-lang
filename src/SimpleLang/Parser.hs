module SimpleLang.Parser
    ( parseExpr
    ) where

import           Data.Functor.Identity (Identity)
import           Text.Parsec           (ParseError, eof, parse, try, (<|>))
import qualified Text.Parsec.Expr      as Ex
import           Text.Parsec.String    (Parser)

import           SimpleLang.Lexer
import           SimpleLang.Syntax

binary :: String
       -> (a -> a -> a)
       -> Ex.Assoc
       -> Ex.Operator String () Identity a
binary s f = Ex.Infix (reservedOp s >> return f)

table :: [[Ex.Operator String () Identity Expr]]
table =
    [ [ binary "+" (:+) Ex.AssocLeft
      , binary "-" (:-) Ex.AssocLeft ]
    , [ binary "*" (:*) Ex.AssocLeft
      , binary "/" (:/) Ex.AssocLeft ]
    ]

int :: Parser Expr
int = (Num . fromInteger) <$> integer

floating :: Parser Expr
floating = Num <$> float

factor :: Parser Expr
factor =  try floating
      <|> try int
      <|> parens expr

expr :: Parser Expr
expr = Ex.buildExpressionParser table factor

contents :: Parser a -> Parser a
contents p = do
    whiteSpace
    r <- p
    eof
    return r

parseExpr :: String -> Either ParseError Expr
parseExpr = parse (contents expr) "<stdin>"
