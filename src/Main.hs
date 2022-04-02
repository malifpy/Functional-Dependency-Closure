module Main where
import System.IO
import Closure
import Parser

main :: IO ()
main = do
    attr_q <- prompt ("Input Atribut              : ")
    fd_q   <- prompt ("Input Functional Dependency: ")
    let attr = parseAttr attr_q
    let fd   = parseFD fd_q
    putFD (closureFD attr fd)

prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine
