module Fib where


import BigNumber

{-1.1 Função recursiva
    F0 = 0
    F1 = 1
    Fn = Fn-1 + Fn-2
-}
fibRec :: (Integral a) => a -> a
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec (n-1) + fibRec (n-2)

{-1.2 Função com programação dinâmica
  lista !! 0 = 0
  lista !! 1 = 1
  lista !! 2 = (lista !! 1) + (lista !! 0) = 0 + 1 = 1
  lista !! i = (lista !! i-1 ) + (lista !! i-2)
-}
fibLista :: (Integral a) => a -> a
fibLista i = lista !! (fromIntegral i)  where lista = 0:1:[lista !! (fromIntegral (x-1)) + (lista !! (fromIntegral x-2)) | x<-[2..i]]

{-1.3 Função com lista infinita
    [F0,F1,F1+F0,...,Fn-1 + Fn-2,...]
-}
fibListaInfinita :: (Integral a) => a -> a
fibListaInfinita n = lista !! (fromIntegral n) where lista = 0:1:(zipWith(+) lista (tail lista))


--3.1 Função recursiva com BigNumber
fibRecBN :: BigNumber -> BigNumber
fibRecBN [0] = [0]
fibRecBN [1] = [1]
fibRecBN n = somaBN (fibRecBN (subBN n [1])) (fibRecBN (subBN n [2]))

--3.2 Função com programação dinâmica com BigNumber
fibListaBN :: BigNumber -> BigNumber
fibListaBN i = lista @@ i where lista = [0]:[1]:[somaBN (lista @@ (subBN x [1])) (lista @@ (subBN x [2])) | x<-(listRange [2] i)]

(@@) :: [BigNumber] -> BigNumber -> BigNumber
(@@) l (y:[]) = l !! y
(@@) l n = (@@) (drop 10 l) (subBN n [1,0])

listRange :: BigNumber -> BigNumber -> [BigNumber]
listRange a b
  | subBN a b == [0] = [b]
  | otherwise = [a] ++ listRange (somaBN a [1]) b

--3.3 Função com lista infinita com BigNumber
fibListaInfinitaBN :: BigNumber -> BigNumber
fibListaInfinitaBN n = lista @@ n where lista = [0]:[1]:(zipWith(somaBN) lista (tail lista))
