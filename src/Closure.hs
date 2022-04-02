module Closure where
-- import Data.Set (Set)
import qualified Data.Set as Set

-- Closure Reflexive
parClosRef :: Ord a => Set.Set a -> Set.Set (Set.Set a, Set.Set a)
parClosRef l = Set.map (\x -> (l, x)) (Set.drop 1 (Set.powerSet l))

closRef :: Ord a => Set.Set a -> Set.Set (Set.Set a, Set.Set a)
closRef l = Set.foldl (\x y -> Set.union x (parClosRef y)) (Set.empty) (Set.drop 1 (Set.powerSet l))

-- Closure Augmentation
parClosAug
  :: Ord a =>
     Set.Set a
     -> (Set.Set a, Set.Set a) -> Set.Set (Set.Set a, Set.Set a)
parClosAug attr fd = Set.map (\x -> (Set.union (fst fd) x, Set.union (snd fd) x)) (Set.powerSet attr)

closAug
  :: Ord a =>
     Set.Set a
     -> Set.Set (Set.Set a, Set.Set a) -> Set.Set (Set.Set a, Set.Set a)
closAug attr fd = Set.foldl (\x y -> Set.union x (parClosAug attr y)) (Set.empty) fd

-- Closure Transitive
filterTrn
  :: (Ord a1, Ord b, Eq a2) =>
     (a1, a2) -> Set.Set (a2, b) -> Set.Set (a1, b)
filterTrn f fd = Set.map (\x -> ((fst f), (snd x))) (Set.filter (\x -> (fst x) == (snd f)) fd)

parClosTrn :: Ord a => Set.Set (a, a) -> Set.Set (a, a)
parClosTrn fd = Set.foldl (\x y -> Set.union x (filterTrn y fd)) (Set.empty) fd

closTrn :: Ord a => Set.Set (a, a) -> Set.Set (a, a)
closTrn fd
    | sub `Set.isSubsetOf` fd = fd
    | otherwise = closTrn (Set.union sub fd)
    where
        sub = parClosTrn fd

closureFD
  :: Ord a =>
     Set.Set a
     -> Set.Set (Set.Set a, Set.Set a) -> Set.Set (Set.Set a, Set.Set a)
closureFD attr fd = Set.union (closRef attr) (closAug attr (closTrn fd))
