module Parser where
import qualified Data.Set as Set

parStrSplit :: [Char] -> [Char] -> ([Char], [Char])
parStrSplit _   "" = ("", "")
parStrSplit del (x:xs)
    | s == del = ("", s')
    | otherwise = (nXRec, xsRec)
    where 
        l = length del
        s = take l (x:xs)
        s' = drop l (x:xs)
        (xRec, xsRec) = parStrSplit del xs
        nXRec = if x == ' ' then xRec else x:xRec

strSplit :: [Char] -> [Char] -> [[Char]]
strSplit _ "" = []
strSplit del str = x:strSplit del y where (x, y) = parStrSplit del str

parParseFD :: [Char] -> (Set.Set [Char], Set.Set [Char])
parParseFD str = (toList x, toList y)
    where 
        (x, y) = parStrSplit "->" str
        toList arg = Set.fromList (strSplit "," arg)

parseFD :: [Char] -> Set.Set (Set.Set [Char], Set.Set [Char])
parseFD str = Set.map (parParseFD) (Set.fromList (strSplit ";" str))

parseAttr :: [Char] -> Set.Set [Char]
parseAttr str = Set.fromList (strSplit "," str)

csStr :: Set.Set [Char] -> [Char]
csStr set = Set.foldl (\x y -> if x == "" then y else x ++ ", " ++ y) "" set

putFD :: Foldable t => t (Set.Set [Char], Set.Set [Char]) -> IO ()
putFD fd = mapM_ (\x -> putStrLn (fStr x)) fd 
    where fStr x = "{" ++ csStr (fst x) ++ "} --> {" ++ csStr (snd x) ++ "}"

