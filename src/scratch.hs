:set -XOverloadedStrings
import Network.Wreq               as WR
import Text.HTML.TagSoup          as TS
import Data.ByteString.Lazy.Char8 as Char8
import Prelude as P
r <- get "https://servirtium.github.io/worldbank-climate-recordings/climateweb/rest/v1/country/annualavg/pr/1980/1999/gbr.xml"
b =  Char8.unpack (r ^. responseBody)
tags = parseTags b
values = P.map fromTagText (P.map (P.!!1) (partitions (isTagOpenName "double") tags))
doubleValues = P.map P.read values :: [Double]