--:set -XOverloadedStrings
import Network.Wreq
import Text.HTML.TagSoup
import Data.List
r <- get "https://servirtium.github.io/worldbank-climate-recordings/climateweb/rest/v1/country/annualavg/pr/1980/1999/gbr.xml"
r ^. responseBody
b =  r ^. responseBody
tags = parseTags b
values = map fromTagText (map (!!1) (partitions (isTagOpenName "double") tags))

