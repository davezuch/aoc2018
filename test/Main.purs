module Test.Main where

import Prelude

import Day1 (sumFrequencies, firstRepeatedFrequency)
import Day2 (checksum)
import Effect (Effect)
import Effect.Console (log)
import Inputs.Day1 (frequencies)
import Inputs.Day2 (ids)

main :: Effect Unit
main = do
  log "Day 1 frequencies"
  log $ "Resulting frequency: " <> show (sumFrequencies frequencies)
  log $ "First repeated frequency: " <> show (firstRepeatedFrequency frequencies)
  log "~~~"
  log "Day 2 IDs"
  log $ "Checksum for all IDs: " <> show (checksum ids)
