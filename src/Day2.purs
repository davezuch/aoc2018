module Day2 where

import Prelude

import Data.Array (elem, filter, foldl, length)
import Data.Map (Map)
import Data.Map (empty, singleton, unionWith, values) as Map
import Data.String (Pattern(..), split)
import Data.Tuple (Tuple(..))

checksum :: String -> Int
checksum = checksum' <<< map (toTuple <<<countDigits) <<< parseIds

countDigits :: String -> Map String Int
countDigits = foldl go Map.empty <<< (split $ Pattern "")
  where
    go :: Map String Int -> String -> Map String Int
    go counter x = Map.unionWith (+) (Map.singleton x 1) counter

toTuple :: Map String Int -> Tuple Boolean Boolean
toTuple counter = do
  let vals = Map.values counter
  Tuple (elem 2 vals) (elem 3 vals)

checksum' :: Array (Tuple Boolean Boolean) -> Int
checksum' xs = (length $ filter twos xs) * (length $ filter threes xs)
  where
    twos (Tuple x _) = x
    threes (Tuple _ x) = x

parseIds :: String -> Array String
parseIds = split (Pattern "\n")
