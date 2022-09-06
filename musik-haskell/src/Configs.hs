module Configs
( loadConfigs
) where

import Data.Aeson
import qualified Data.ByteString.Lazy as BL

convertToList :: Maybe [a] -> [a]
convertToList Nothing = []
convertToList (Just xs) = xs

-- loadConfigs :: IO [[Int]]
loadConfigs :: IO [[Int]]
loadConfigs = do
    configData <- BL.readFile "C:/Users/joshs/Desktop/data.json"
    let x = decode configData :: Maybe [[Int]]
    return $ convertToList x