{-1.1 Função recursiva
    F0 = 1
    F1 = 1
    Fn = Fn-1 + Fn-2
-}
fibRec :: (Integral a) => a -> a
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec (n-1) + fibRec (n-2)

{-1.2 Função com programação dinámica
  lista !! 0 = 0
  lista !! 1 = 1
  lista !! 2 = (lista !! 1) + (lista !! 0) = 0 + 1 = 1
  lista !! i = (lista !! i-1 ) + (lista !! i-2)
-}
fibLista :: Int -> Int
fibLista i = lista !! i where lista = 0:1:[lista !! (x-1) + (lista !! (x-2)) | x<-[2..i]]

{-1.3 Função com lista infinita
    [F0,F1,F1+F0,...,Fn-1 + Fn-2,...]
-}
fibListaInfinita :: Int -> Int
fibListaInfinita n = lista !! n where lista = 0:1:(zipWith(+) lista (tail lista))
