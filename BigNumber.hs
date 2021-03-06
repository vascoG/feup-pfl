module BigNumber where

--2.1 Definição de BigNumber
type BigNumber = [Int]

--2.2. Função scanner, converte uma String em BigNumber
scanner :: String -> BigNumber
scanner []=[]
scanner (x:[]) = [charToInt x]
scanner (x:y:xs)
  | x == '-' = (-1)*(charToInt y):(scanner' xs)
  | otherwise = charToInt x:(scanner' (y:xs))

scanner' :: String -> BigNumber
scanner' [] = []
scanner' (x:xs) = charToInt x:(scanner' xs)

charToInt :: Char -> Int
charToInt '0' = 0
charToInt '1' = 1
charToInt '2' = 2
charToInt '3' = 3
charToInt '4' = 4
charToInt '5' = 5
charToInt '6' = 6
charToInt '7' = 7
charToInt '8' = 8
charToInt '9' = 9
charToInt _ = error("Erro a converter um carácter num número")

--2.3. Função output, converte um BigNumber numa String
output :: BigNumber -> String
output [] = []
output (x:xs)
  | x < 0 = '-':(intToChar (abs x)):(output' xs)
  | otherwise = intToChar x:(output' xs)

output' :: BigNumber -> String
output' [] = []
output' (x:xs) = intToChar x:(output' xs)

intToChar :: Int -> Char
intToChar 0 = '0'
intToChar 1 = '1'
intToChar 2 = '2'
intToChar 3 = '3'
intToChar 4 = '4'
intToChar 5 = '5'
intToChar 6 = '6'
intToChar 7 = '7'
intToChar 8 = '8'
intToChar 9 = '9'
intToChar _ = error("Erro a converter um número num carácter")

--Funções auxiliares para os restantes exercícios
verificaBN :: BigNumber -> Bool
verificaBN [] = True
verificaBN (x:xs)
  | x<=9 && x>=(-9) = verificaBNAux xs
  | otherwise = False

verificaBNAux :: BigNumber -> Bool
verificaBNAux [] = True
verificaBNAux (x:xs)
  | x<=9 && x>=0 = verificaBNAux xs
  | otherwise = False

removeZero :: BigNumber -> BigNumber
removeZero (x:xs)
  | xs == [] = [x]
  | x==0 = removeZero xs
  | otherwise = (x:xs)


maiorQue :: BigNumber -> BigNumber -> Bool
maiorQue (x:xs) (y:ys)
  | lenX > lenY = True
  | lenY > lenX = False
  | x > y = True
  | y > x = False
  | x == y && xs == [] = False
  | otherwise = maiorQue xs ys
  where
    lenX = length (x:xs)
    lenY = length (y:ys)

adicionaSinal :: BigNumber -> BigNumber
adicionaSinal (x:xs) = (-x:xs)

--2.4. Função somaBN, calcula a soma de 2 BigNumbers
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN x []
  | verificaBN x == False = error("Os argumentos não são BigNumbers!")
  | otherwise = x
somaBN [] y
  | verificaBN y == False = error("Os argumentos não são BigNumbers!")
  | otherwise = y
somaBN (x:xs) (y:ys)
  | verificaBN (x:xs) == False || verificaBN (y:ys) == False = error("Os argumentos não são BigNumbers!")
  | x < 0 && y < 0 = adicionaSinal $ removeZero $ reverse $ somaBNAux (reverse(-x:xs)) (reverse(-y:ys))
  | x >= 0 && y >= 0 = removeZero $ reverse $ somaBNAux (reverse (x:xs)) (reverse (y:ys))
  | otherwise = if maiorQue (abs x:xs) (abs y:ys) then somaBNAux1 (x:xs) (y:ys) else somaBNAux1 (y:ys) (x:xs)

somaBNAux :: BigNumber -> BigNumber -> BigNumber
somaBNAux x [] = x
somaBNAux [] y = y
somaBNAux (x:xs) (y:ys)
  | x+y>=10 = (x+y-10):somaBNAux (somaBNAux xs [1]) ys
  | otherwise = (x+y):somaBNAux xs ys

somaBNAux1 :: BigNumber -> BigNumber -> BigNumber
somaBNAux1 (x:xs) (y:ys)
  | x < 0 = adicionaSinal $ removeZero $ reverse $ subtrairBNAbs (reverse(abs x:xs)) (reverse(abs y:ys))
  | otherwise =  removeZero $ reverse $ subtrairBNAbs (reverse(abs x:xs)) (reverse(abs y:ys))

subtrairBNAbs :: BigNumber -> BigNumber -> BigNumber
subtrairBNAbs [] l = l
subtrairBNAbs l [] = l
subtrairBNAbs (x:xs) (y:ys)
  | x - y < 0 = (x - y + 10):subtrairBNAbs (subtrairBNAbs xs [1]) ys
  | otherwise = (x - y):subtrairBNAbs xs ys

--2.5 Função subBN, calcula a subtração de dois BigNumbers
subBN :: BigNumber -> BigNumber -> BigNumber
subBN x y
  | verificaBN x == False || verificaBN y == False = error("Os argumentos não são BigNumbers!")
  | otherwise = somaBN x (adicionaSinal y)

--2.6 Função mulBN, calcula a multiplicação de dois BigNumbers
mulBN :: BigNumber -> BigNumber -> BigNumber
mulBN [] _ = []
mulBN _ [] = []
mulBN (x:xs) (y:ys)
  | verificaBN (x:xs) == False || verificaBN (y:ys) == False = error("Os argumentos não são BigNumbers!")
  | (x<0 && y<0) || (x>=0 && y>=0) = removeZero $reverse $ mulBNAux1 $ mulBNAux (reverse (abs x:xs)) (reverse (abs y:ys))
  | otherwise = removeZero $ adicionaSinal $ reverse $ mulBNAux1 $ mulBNAux (reverse (abs x:xs)) (reverse (abs y:ys))

mulBNAux :: BigNumber -> BigNumber -> BigNumber
mulBNAux (x:[]) ys = escalaBN x ys
mulBNAux (x:xs) ys = somaBNAux (escalaBN x ys) (mulBNAux xs (0:ys))

escalaBN :: Int -> BigNumber -> BigNumber
escalaBN n x = map (n*) x

mulBNAux1 :: BigNumber -> BigNumber
mulBNAux1 [] = []
mulBNAux1 (x:xs)
  | x >= 10 = (mod x 10):mulBNAux1 (somaBNAux xs [div x 10])
  | otherwise = x:mulBNAux1 xs

--2.7 Função divBN, calcula a divisão de dois BigNumbers
divBN :: BigNumber -> BigNumber -> (BigNumber,BigNumber)
divBN x y
  | verificaBN x == False || verificaBN y == False = error("Os argumentos não são BigNumbers!")
  | maiorQue y [0] = (removeZero $ reverse (fst z),removeZero $ snd z)
  | otherwise = error("Não é possível fazer essa divisão!")
  where z = divBNAux x y ([0],[0])


divBNAux :: BigNumber -> BigNumber -> (BigNumber,BigNumber) -> (BigNumber,BigNumber)
divBNAux x y z
  | (maiorQue y x) = (fst z,x)
  | otherwise = divBNAux (subBN x y) y (somaBNAux (fst z) [1],snd z)


--5 Função safeDivBN, calcula a divisão de dois BigNumbers e deteta a divisão por 0
safeDivBN :: BigNumber -> BigNumber -> Maybe (BigNumber, BigNumber)
safeDivBN _ [0] = Nothing
safeDivBN x y
  | verificaBN x == False || verificaBN y == False = error("Os argumentos não são BigNumbers!")
  | otherwise = Just (divBN x y)
