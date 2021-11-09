{-1.1 Função recursiva
    F1 = 1
    F2 = 1
    Fn = Fn-1 + Fn-2
-}
fibRec :: (Integral a) => a -> a
fibRec 1 = 1
fibRec 2 = 1
fibRec n = fibRec (n-1) + fibRec (n-2)

{-1.2 Função com programação dinámica
-}
fibLista :: Int -> Int
fibLista 1 = 1
fibLista 2 = 1
fibLista i = lista !! i where lista = [fibLista (i-1) + fibLista(i-2) | x<-[0..i]]

{-1.3 Função com lista infinita
    [F1,F2,F1+F2,...,Fi-1 + Fi-2]
-}
fibListaInfinita :: Int -> Int
fibListaInfinita n = lista !! n where lista = 0:1:(zipWith(+) lista (tail lista))
