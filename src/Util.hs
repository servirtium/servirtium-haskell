{-# LANGUAGE NoImplicitPrelude #-}
-- | Silly utility module, used to demonstrate how to write a test
-- case.
module Util
  ( plus2
  , getAverageAnnualRainfall
  ) where

import RIO

plus2 :: Int -> Int
plus2 = (+ 2)

getAverageAnnualRainfall :: Int -> Int -> String -> Rational
getAverageAnnualRainfall _ _ _ = 1977690994466203 / 2000000000000