{- Exercise 3.2 -}

-- version where recursion counts downwards until 0
sum_down :: Integer -> Integer
sum_down n = if n > 0 then n + sum_down (n - 1) else 0

-- version where recursion counts upwards until n
sum_up :: Integer -> Integer
sum_up n = sum_up_helper 0 n

-- function needed to count up
sum_up_helper :: Integer -> Integer -> Integer
sum_up_helper n_curr n_max = if n_curr < n_max
                           then n_curr + sum_up_helper (n_curr + 1) n_max
                           else n_max

-- any solution
fib :: Integer -> Integer
fib n = if n == 0 then 0
        else if n == 1 then 1
        else fib (n - 1) + fib (n - 2)

-- efficient version
fib_eff :: Integer -> Integer
fib_eff n = if n == 0 then 0
            else if n == 1 then 1
            else fib_aux 0 1 2 n

fib_aux :: Integer -> Integer -> Integer -> Integer -> Integer
fib_aux f_l f_h n_curr n_max =
    if n_curr == n_max then f_l + f_h
    else fib_aux f_h (f_l + f_h) (n_curr + 1) n_max



{- Exercise 3.3 -}

-- Determines if x is divisible by y
isDivisible :: Integer -> Integer -> Bool
isDivisible x y = if x - y > 0 then isDivisible (x - y) y
                  else x - y == 0

isPrime :: Integer -> Bool
isPrime n = if n >= 2 then isPrime_helper 2 n else False

-- Helper function for isPrime
isPrime_helper :: Integer -> Integer -> Bool
isPrime_helper n_curr n_max = if n_curr > n_max `div` 2 then True --only half n_max needed
  else if isDivisible n_max n_curr then False
  else isPrime_helper (n_curr + 1) n_max

{- Tests -}
{- You don't have to understand the Haskell-code in the tests,
   but you can just invoke them after having implemented
   some exercises -}

-- tests for sum
sums = [0,1,3,6,10,15,21,28,36,45,55]
test_sum_down = map sum_down [0..10] == sums
  || error "test failed on sum_down"
test_sum_up   = map sum_up [0..10] == sums
  || error "test failed on sum_up"
test_sum = test_sum_up && test_sum_down

-- tests for fib
fibs = [0,1,1,2,3,5,8,13,21,34]
test_fib = map fib [0 .. 9] == fibs
  || error "test fib failed"
test_fib_eff = map fib_eff [0 .. 9] == fibs
  || error "test fib_eff failed"
test_fib_both = test_fib && test_fib_eff

-- tests for primes
primes = [2,3,5,7,11,13,17,19]
test_primes = filter isPrime [0..20] == primes
  || error "test_primes failed"

-- test for all exercises
test_all = test_primes && test_sum && test_fib_both
