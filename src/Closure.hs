module Closure where
-- import Data.Set (Set)
import qualified Data.Set as Set

parClosRef :: Ord a => Set.Set a -> Set.Set (Set.Set a, Set.Set a)
parClosRef l = Set.map (\x -> (l, x)) (Set.drop 1 (Set.powerSet l))

closRef :: Ord a => [a] -> Set.Set (Set.Set a, Set.Set a)
closRef l = Set.foldr (Set.union) (Set.empty) (Set.map (parClosRef) (Set.drop 1 (Set.powerSet (Set.fromList l))))
