module Main (main) where
import System.Random
import Musik

main :: IO ()
main = do
    gen <- getStdGen   -- for floats
    gen' <- newStdGen  -- for bools
    let floaties :: [Float]; floaties = take 20 $ randomRs (0, 1) gen
    let bools    :: [Bool]; bools = take 20 $ randomRs (False, True) gen'

    -- Get Global Key
    let key_global = Musik.keyConstructor (floaties !! 0) (bools !! 0)
    print key_global
