{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Test (main) where
import Network.Wreq               as WR
import Text.HTML.TagSoup          as TS
import Data.ByteString.Lazy.Char8 as Char8
import Data.List                  as L
import Prelude                    as P
import Control.Lens               as CL

main :: IO ()
main = do
  r <- get "https://servirtium.github.io/worldbank-climate-recordings/climateweb/rest/v1/country/annualavg/pr/1980/1999/gbr.xml"
  let b = Char8.unpack (r CL.^. responseBody)
  let tags = parseTags b
  let values = P.map fromTagText (P.map (P.!!1) (partitions (isTagOpenName "double") tags))
  let doubleValues = P.map P.read values :: [Double]
  let doubleLength = L.genericLength doubleValues
  let doubleSum = P.realToFrac (P.sum(doubleValues))
  let outputValue = if doubleLength > 0 then doubleSum / doubleLength else 0
  P.print outputValue