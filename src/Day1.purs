module Day1 where

import Prelude

import Data.Array (catMaybes, uncons)
import Data.Int (fromString)
import Data.Maybe (Maybe(..))
import Data.Set (Set)
import Data.Set (empty, insert, member) as Set
import Data.String (Pattern(..), split)
import Data.Traversable (sum)

sumFrequencies :: String -> Int
sumFrequencies = sum <<< parseFrequencies

firstRepeatedFrequency :: String -> Int
firstRepeatedFrequency input = go 0 Set.empty freqs
  where
    freqs :: Array Int
    freqs = parseFrequencies input

    go :: Int -> Set Int -> Array Int -> Int
    go cur counter xs =
      case uncons xs of
        Nothing -> go cur counter freqs
        Just { head, tail } -> do
          let next = cur + head
          if Set.member next counter
            then next
            else go next (Set.insert next counter) tail

parseFrequencies :: String -> Array Int
parseFrequencies = catMaybes <<< map fromString <<< split (Pattern "\n")
