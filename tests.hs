import Fib





comparaFibInt :: Int -> IO ()
comparaFibInt n = do
  putStrLn $ "n = " ++ (show n) ++ ":"
  putStrLn $ "FibLista: " ++ (show $ fibLista n)
  putStrLn $ "FibListaInfinita " ++ (show $ fibListaInfinita n )

comparaFibInteger :: Integer -> IO ()
comparaFibInteger n = do
  putStrLn $ "n = " ++ (show n) ++ ":"
  putStrLn $ "FibLista: " ++ (show $ fibLista n)
  putStrLn $ "FibListaInfinita " ++ (show $ fibListaInfinita n )
