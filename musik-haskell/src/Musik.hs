module Musik
( keyConstructor
) where

data PitchClass = C | D | E | F | G | A | B deriving (Show, Eq)
data Mode = MAJOR | MINOR deriving (Show)
data ChordQuality = Major | Minor | Diminished deriving (Show)

modeRandom :: Bool -> Mode
modeRandom bool = if bool == True then MAJOR else MINOR

pitchClassRandom :: Float -> PitchClass
pitchClassRandom float
    | float < 0.25 = C
    | float < 0.5  = D
    | float < 0.75 = E
    | otherwise    = F

data Key = Key {
      pitchClass :: PitchClass
    , mode       :: Mode
} deriving (Show)

keyConstructor :: Float -> Bool -> Key
keyConstructor float bool = Key pc m
    where pc = pitchClassRandom float
          m  = modeRandom bool