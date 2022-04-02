module Parser where
import qualified Data.Set as Set

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

strSplit _ "" = []
strSplit del str = x:strSplit del y where (x, y) = parStrSplit del str

parParseFD str = (toList x, toList y)
    where 
        (x, y) = parStrSplit "->" str
        toList arg = Set.fromList (strSplit "," arg)

parseFD str = Set.map (parParseFD) (Set.fromList (strSplit ";" str))
