{-# LANGUAGE TemplateHaskell #-}
module Simon_Heis_Ex04 where

{- Exercise 4.1 -}

-- 1) using if-then-else, and, or, not
boolFunIf :: Bool -> Bool -> Bool -> Bool
boolFunIf a b c =
  if c && not a || b && not c
    then True
    else False

-- 2) not using if-then-else, and, or, not
boolFunAon :: Bool -> Bool -> Bool -> Bool
boolFunAon a b c = c && not a || b && not c

-- 3) using pattern matching
boolFunPm :: Bool -> Bool -> Bool -> Bool
boolFunPm False _ True = True
boolFunPm _ True False = True
boolFunPm _ _ _        = False

{- Exercise 4.2 -}

-- 4.2.1
--
-- define this datatype and the functions below
data Party
  = Oevp
  | Spoe
  | Fpoe
  | Gruene
  | Neos
  deriving (Show)

mps :: Party -> Integer
mps p =
  case p of
    Oevp   -> 71
    Spoe   -> 40
    Fpoe   -> 31
    Gruene -> 26
    Neos   -> 15

coalition :: Party -> Party -> Bool
coalition x y = mps x + mps y >= 92

-- 4.2.2

-- define this datatype and the functions below
data Season
  = Spring
  | Summer
  | Fall
  | Winter
  deriving (Show, Eq)

-- define the function and write the type signature
-- pattern matching
daysInSeasonPM :: Season -> Integer
daysInSeasonPM Spring = 93
daysInSeasonPM Summer = 94
daysInSeasonPM Fall   = 90
daysInSeasonPM Winter = 89

-- if-then-else
daysInSeasonITE :: Season -> Integer
daysInSeasonITE s =
  if s == Spring
    then 93
    else if s == Summer
      then 94
      else if s == Fall
        then 90
        else 89


{- Exercise 4.3 -}

-- 4.3.1

-- define the function and write the type signature
threeEqual :: Eq a => a -> a -> a -> Bool
threeEqual x y z = x == y && x == z


-- 4.3.2

foo :: a -> a -> a
foo x y = x

bar :: a -> a -> a
bar x y = y



{- Tests -}
{- You don't have to understand the Haskell-code in the tests,
   but you can just invoke them after having implemented
   some exercises -}

testData :: [((Bool, Bool, Bool), Bool)]
testData =
  [ ((False, False, False), False)
  , ((False, False, True) , False)
  , ((False, True, False) , True)
  , ((False, True, True)  , True)
  , ((True, False, False) , False)
  , ((True, False, True)  , True)
  , ((True, True, False)  , True)
  , ((True, True, True)   , False)
  ]

uncurry3 :: (a -> b -> c -> d) -> ((a, b, c) -> d)
uncurry3 f (x, y, z) = f x y z

testBool :: (Bool -> Bool -> Bool -> Bool) -> Bool
testBool f = all (\t -> (snd t ==) . uncurry3 f $ fst t) testData

testBoolIf, testBoolAon, testBoolPm :: Bool
testBoolIf = testBool boolFunIf || error "test for boolFunIf failed"
testBoolAon = testBool boolFunAon || error "test for boolFunIf failed"
testBoolPm = testBool boolFunPm || error "test for boolFunIf failed"

testThreeEqual :: Bool
testThreeEqual =
  threeEqual 'a' 'a' 'a'
    && not (threeEqual True False True)
    && not (threeEqual 2 1 1)
    && not (threeEqual 1 1 2)
    && not (threeEqual 1 2 2)
    && not (threeEqual 2 1 2)
    && not (threeEqual 2 2 1)
    && not (threeEqual "a" "b" "c")
    || error "test for threeEqual failed"

testFooBar = foo 1 2 /= bar 1 2 && foo True False /= bar True False

testAll :: Bool
testAll = testBoolIf && testBoolAon && testBoolPm && testThreeEqual && testFooBar
