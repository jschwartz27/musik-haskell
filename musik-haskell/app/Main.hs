module Main (main) where
import System.Random
import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import Musik
-- import qualified Configs

convertToList :: Maybe [a] -> [a]
convertToList Nothing   = []
convertToList (Just xs) = xs

main :: IO ()
main = do
    gen <- getStdGen   -- for floats
    gen' <- newStdGen  -- for bools
    let floaties :: [Float]; floaties = take 20 $ randomRs (0, 1) gen
    let bools    :: [Bool]; bools = take 20 $ randomRs (False, True) gen'

    -- Get Global Configs as List
    configData <- BL.readFile "C:/Users/joshs/Desktop/data.json"
    let x = decode configData :: Maybe [[Int]]
    let global_configs = convertToList x
    -- print global_configs
    -- print $ global_configs !! 0
    -- Get Global Key
    let key_global = Musik.keyConstructor (floaties !! 0) (bools !! 0)
    print key_global