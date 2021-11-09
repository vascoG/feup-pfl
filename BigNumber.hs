--2.1
type BigNumber = [Int]
--2.2
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN x y = reverse(somaBNAux (reverse x) (reverse y))

somaBNAux :: BigNumber -> BigNumber -> BigNumber
somaBNAux x [] = x
somaBNAux [] y = y
somaBNAux (x:xs) (y:ys)
  | x+y>=10 = (x+y-10):somaBNAux (somaBNAux xs [1]) ys
  | otherwise = (x+y):somaBNAux xs ys
--2.3

subBN :: BigNumber -> BigNumber -> BigNumber
subBN x y = removeZero (reverse(subBNAux (reverse x) (reverse y)))

subBNAux :: BigNumber -> BigNumber -> BigNumber
subBNAux x [] = x
subBNAux [] y = y
subBNAux (x:xs) (y:ys)
  | y>x = (x-y+10):subBNAux xs (somaBNAux ys [1])
  | otherwise = (x-y):subBNAux xs ys

removeZero :: BigNumber -> BigNumber
removeZero (x:xs)
  | x==0 = removeZero xs
  | otherwise = (x:xs)

--2.4
mulBN :: BigNumber -> BigNumber -> BigNumber
mulBN x y
  
