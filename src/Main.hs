module Main where
import System.IO
import Closure
import Parser
-- import qualified Data.Set as Set

main :: IO ()
main = do
    print (closRef ["Car", "Mobil"])
    print (parseFD "Car -> Mobil ; Mobil, Motor -> Car; J -> F")
    -- print (map (strSplit "->") (strSplit "," "ABC -> DEF , A -> F , J -> F"))
    -- printLis ((parSubs ['A'..'E']) !! 1)
    -- name <- prompt "Siapa Namamu? "
    -- putStrLn ("Hey " ++ name ++ ", you rock!")


prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine

printLis (x:xs) = 
    do
        putChar x
        if (null xs) 
        then do
            putChar '\n'
        else do
            putStr ", "
            printLis xs
