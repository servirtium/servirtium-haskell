{-# LANGUAGE NoImplicitPrelude #-}
module UtilSpec (spec) where

import Import
import Util
import Test.Hspec
import Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "plus2" $ do
    it "basic check" $ plus2 0 `shouldBe` 2
    it "overflow" $ plus2 maxBound `shouldBe` minBound + 1
    prop "minus 2" $ \i -> plus2 i - 2 `shouldBe` i
  describe "average rain fall for great Britian from 1980 to 1999" $ do
    it "should return correct value" $ getAverageAnnualRainfall 1980 1999 "gbr" `shouldBe` 988.8454972331015