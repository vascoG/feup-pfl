--1 - cada soluçao tem de ser mais eficiente que a anterior, testar casos limites, 5+5 = 10, 5-6=-1, criar um ficheiro auxiliar com testes usando IO()
--2 atençao aos numeros negativos
-- zip aos ficheiros e nao a pasta externa

--2.1 duvida nesta
type BigNumber = [Int]
--2.2 Era nice ter um limpador para tirar os 0 a esquerda no fim
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

--2.3
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

--2.4
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN x y = reverse(somaBNAux (reverse x) (reverse y))

somaBNAux :: BigNumber -> BigNumber -> BigNumber
somaBNAux x [] = x
somaBNAux [] y = y
somaBNAux (x:xs) (y:ys)
  | x+y>=10 = (x+y-10):somaBNAux (somaBNAux xs [1]) ys
  | otherwise = (x+y):somaBNAux xs ys

--2.5

--casos teste, 6-5 = 1, 5-6 = -1, 15-6 = 9, 6-15 = -9, 25-6 = 19, 6-25 = -19, 25-26=-1 (falta confirmar com a subbnteste)
-- a ideia é se o 2ºBN for maior que o primeiro BN, fazer a conta ao contrario e acrescentar um -
-- casos a falhar: 25-(-25) (funciona com subbnteste)  [-5] - [9] = [-14]? falta confirmar na soma se x+y-10 é menor que -9
-- A - B = A + (-B) :D (subbnteste)

subBnTeste :: BigNumber -> BigNumber -> BigNumber
subBnTeste x y = somaBN x (adicionaSinal y)

subBN :: BigNumber -> BigNumber -> BigNumber
subBN x y
  | maiorQue x y = removeZero $ reverse $ subBNAux (reverse x) (reverse y)
  | otherwise = adicionaSinal $ removeZero $ reverse $ subBNAux (reverse y) (reverse x)

subBNAux :: BigNumber -> BigNumber -> BigNumber
subBNAux x [] = x
subBNAux [] y = y
subBNAux (x:xs) (y:ys)
  | y>x = (x-y+10):subBNAux xs (somaBNAux ys [1])
  | otherwise = (x-y):subBNAux xs ys

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
  | x == y && x < 0 = maiorQue ys xs
  | otherwise = maiorQue xs ys
  where
    lenX = length (x:xs)
    lenY = length (y:ys)

adicionaSinal :: BigNumber -> BigNumber
adicionaSinal (x:xs) = (-x:xs)

--2.6
