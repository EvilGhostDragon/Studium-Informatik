
module Simon_Heis_Ex08 where
{- 8.1 higher order functions -}

code :: Char -> String
code 'a' = "01"
code 'b' = "1"
code 'c' = "001"
code 'd' = "0001"

code2 :: Char -> String
code2 'a' = "11"
code2 'b' = "101"
code2 'c' = "01"
code2 'd' = "0011"

isPrefix, neitherPrefix :: String -> String -> Bool
isPrefix s t = null s || (not (null t) && head s == head t && isPrefix (tail s) (tail t))
neitherPrefix s t = not (isPrefix s t) && not (isPrefix t s)

{- TODO change this function and the type signature -}
encode :: (Char -> String ) -> String -> String
encode fun s = if null s then "" else fun (head s) ++ encode (fun) (tail s)


{- TODO change this function and the type signature -}
decode :: (Char -> String) -> String -> String
decode fun s = if null s then "" else [char]++ decode fun (drop (length (fun char)) s) where
  char = aux fun 'a' 'd' s
  aux fun c d s = if (isPrefix (fun c) s) then c else if (c == d) then
              error ("not decodable:"++s) else aux fun (succ c) d s

{- TODO write this function and the corresponding type signature -}
-- compareCodes ::
compareCodes :: (Char -> String ) -> (Char -> String) -> String -> (Bool, String, String)
compareCodes fun1 fun2 s = (better, encode fun1 s, encode fun2 s) where
  better = length(encode fun1 s)<=length(encode fun2 s)
  

{- TODO find Strings (length at least 5) for which code and code2 respectively generate shorter encodings, using compareCodes -}


{- TODO write this function and the corresponding type signature -}
-- nTimes ::
nTimes :: (a -> a) -> Integer -> (a -> a)
nTimes fun num
  | num == 0 = id
  | otherwise = fun . nTimes fun (num -1) 

{- 8.2.1 type signatures partial application -}

-- div1 ::
div1 = (/)

-- div2 ::
div2 = (2/)

-- div3 ::
div3 = (/2)

-- eqTuple ::
eqTuple f = (\(x,y) -> f x == f y)

-- eqTuple' ::
eqTuple' f (x, y) = f x == f y

{- 8.3.2 drop parenthesis -}
append :: [a] -> [a] -> [a]
append = (++) 

not0 :: (Eq a, Num a) => a -> Bool
not0 = (/=0)

foo x = not0 (head (tail (tail x)))

foo1 x (y, z) = not0 (head (append y (append (tail x) z)))

{- tests -}

testNTimes = nTimes id 100 5 == 5 && nTimes (+1) 100 5 == 105

testEx81 = testNTimes && all ((\(x,_,_)->x) . compareCodes code code2) ["b", "ab", "bc"]

testAll = testEx81
