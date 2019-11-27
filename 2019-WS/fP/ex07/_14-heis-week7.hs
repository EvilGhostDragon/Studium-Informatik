{-# LANGUAGE TemplateHaskell #-}
module Simon_Heis_Ex07 where

{- 7.1.1 define datatypes for our points in the coordinate systems -}

data Polar = Polar Double Double
data Cart = Cart Double Double

-- createPolar ::
createPolar :: Double -> Double -> Polar
createPolar r phi = Polar r (phi * pi / 180)

{- 7.1.2 Write a function which converts Cart into a Tuple -}

-- cart2Tuple ::
cart2Tuple :: Cart -> (Double, Double)
cart2Tuple (Cart a b) = (a, b)

-- polar2Tuple ::
polar2Tuple :: Polar -> (Double, Double)
polar2Tuple (Polar r phi) = (r, phi)


{- 7.1.3 define conversion functions between the coordinate systems -}

polar2Cart :: Polar -> Cart
polar2Cart (Polar r phi) = Cart (r*cos(phi)) (r*sin(phi))

cart2Polar :: Cart -> Polar
cart2Polar (Cart a b) = Polar r prad where
  r = sqrt(a*a+b*b)
  d = 0
  prad
    | (b >= 0) && (r /= 0) = acos(a/r)
    | (b < 0) = -acos(a/r)
    | r == 0 = d

{- 7.1.4 write a Show instance for our datatypes -}

instance Show Polar where
  show (Polar r phi) = show (polar2Cart (Polar r phi))

instance Show Cart where
  show (Cart a b) = "(" ++ show(fromInteger (round (a*10))/10) ++ ", " ++ show(fromInteger (round (b*10))/10) ++ ")"

{- 7.2 -}

code :: Char -> String
code 'a' = "01"
code 'b' = "1"
code 'c' = "001"
code 'd' = "0001"

{- 7.2.1 -}

encode :: String -> String
encode s = if null(s)
  then ""
  else code (head s) ++ encode (tail s)


{- 7.2.2 -}

isPrefix, neitherPrefix :: String -> String -> Bool
isPrefix s t
  | null (s) = True
  | null (t) = False
  | head s == head t = isPrefix (tail s) (tail t)
  | head s /= head t = False

neitherPrefix s t = not((isPrefix s t)||(isPrefix t s))

{- 7.2.3 -}

decode :: String -> String
decode s
  | isPrefix "01" s = "a" ++ (decode (drop 2 s))
  | isPrefix "1" s = "b" ++ (decode (drop 1 s))
  | isPrefix "001" s = "c" ++ (decode (drop 3 s))
  | isPrefix "0001" s = "d" ++ (decode (drop 4 s))
  | otherwise = ""

{- 7.2.4-}

isPrefixCode :: Bool
isPrefixCode = neitherPrefix (encode "a") (encode "b") && neitherPrefix (encode "a") (encode "c") && neitherPrefix (encode "a") (encode "d") && neitherPrefix (encode "b") (encode "c") && neitherPrefix (encode "a") (encode "d") && neitherPrefix (encode "c") (encode "d")

{- Tests -}

epsilon, radius, angle :: Double
epsilon = 0.001
radius = sqrt 2
angle  = 45

polar :: Polar
polar = createPolar radius angle

cart :: Cart
cart  = polar2Cart $ polar

testCP = (\(r,a) -> r == radius && a == (angle / (180 / pi))) . polar2Tuple $ polar

diff (r, p) (r', p') =
  (abs $ r - r') < epsilon && (abs $ p - p') < epsilon

testConversionP = diff p mP
  where
    mP = polar2Tuple . cart2Polar . polar2Cart $ polar
    p  = polar2Tuple $ polar

testConversionC = diff c mC
  where
    mC = cart2Tuple . polar2Cart . cart2Polar $ cart
    c  = cart2Tuple $ cart

testConversionPT = diff (radius, angle / (180 / pi)) (polar2Tuple $ polar)

testConversionCT = diff (1.0, 1.0) (cart2Tuple $ cart)

testShow = (show cart) == (show polar)

{- Tests for exc 7.2 -}

testFun :: (Show a,Show b,Eq b) => (a -> b) -> [(a,b)] -> Bool
testFun f = all (\p -> f (fst p) == snd p ||
  error ("on input "++(show (fst p))++" output is "++(show (f (fst p)))++" but should be "++(show (snd p))))
testFun2 f l = testFun (\p -> f (fst p) (snd p)) (map (\(x,y,z) -> ((x,y),z)) l)
testFun0 f l = testFun (\() -> f) (map (\x -> ((),x)) l)
testEncode = testFun encode ioEncode
ioEncode = [("",""),("c","001"),("abcd","0110010001"),("dcba","0001001101")]
testIsPrefix = testFun2 isPrefix ioIsPrefix
ioIsPrefix = [("","0",True),("1","",False),("1110","111",False),("00","0001",True),("aab","aaaab",False)]
testNeitherPrefix = testFun2 neitherPrefix ioNeitherPrefix
ioNeitherPrefix = [("","a",False),("000","00",False),("010","1",True),("001","0001",True)]
testDecode = testFun decode ioDecode
ioDecode = [("0110010001","abcd"),("0001001101","dcba"),("010101","aaa"),("","")]
testIsPrefixCode = testFun0 isPrefixCode ioIsPrefixCode
ioIsPrefixCode = [True]
testExc72 = testEncode && testIsPrefix && testNeitherPrefix && testDecode && testIsPrefixCode

{- Test all exercises -}

testAll = testConversionP && testConversionC && testConversionPT &&
          testConversionCT && testCP && testShow && testExc72
