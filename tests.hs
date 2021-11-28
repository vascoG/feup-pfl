import Fib
import BigNumber

testes :: IO()
testes = do
  putStrLn $ ""
  putStrLn $ "--------- FIBONACCI ----------"
  putStrLn $ ""
  comparaFibInt 6
  comparaFibBN [6]
  putStrLn $ ""
  comparaFibInt 20
  comparaFibBN [2,0]
  putStrLn $ ""
  putStrLn $ "------Teste do alcance máximo de cada tipo------"
  putStrLn $ ""
  putStrLn $ "Int -> Int : "
  putStrLn $ ""
  comparaFibInt 92
  comparaFibBN [9,2]
  putStrLn $ ""
  comparaFibInt 93
  comparaFibBN [9,3]
  putStrLn $ ""
  putStrLn $ "Integer -> Integer e BigNumber -> BigNumber : "
  putStrLn $ ""
  putStrLn $ "Tanto a função usando os tipos Integer -> Integer e BigNumber -> BigNumber calculam corretamente o Fibonnaci de números muito superiores, sendo o valor máximo testado de 5000"
  putStrLn $ ""
  putStrLn $ "--------- BIG NUMBER ----------"
  putStrLn $ ""
  putStrLn $ "------Teste scanner(String)------"
  putStrLn $ ""
  testScanner "123"
  testScanner "0"
  testScanner "-123"
  putStrLn $ ""
  putStrLn $ "------Teste output(BigNumber)------"
  putStrLn $ ""
  testOutput [1,2,3]
  testOutput [0]
  testOutput [-1,2,3]
  putStrLn $ ""
  putStrLn $ "------Teste verificaBN(BigNumber)------"
  putStrLn $ ""
  testVerificaBN [1,2,3]
  testVerificaBN [10]
  testVerificaBN [-1,2,-3]
  putStrLn $ ""
  putStrLn $ "------Teste removeZero(BigNumber)------"
  putStrLn $ ""
  testRemoveZero [0,0,1,2,3]
  testRemoveZero [1,0,1,0]
  putStrLn $ ""
  putStrLn $ "------Teste maiorQue(BigNumber, BigNumber)------"
  putStrLn $ ""
  testMaiorQue [1,2,3] [1,0,0]
  testMaiorQue [1,0,0] [1,2,3]
  testMaiorQue [1,2,3] [1,2,3]
  testMaiorQue [1,2,3] [1,2,3,4]
  testMaiorQue [1,2,3,4] [1,2,3]
  putStrLn $ ""
  putStrLn $ "------Teste somaBN(BigNumber, BigNumber)------"
  putStrLn $ ""
  testSomaBN [-1,7] [9,5]
  testSomaBN [1,7] [-9,5]
  testSomaBN [1,7] [9,5]
  testSomaBN [-1,7] [-9,5]
  testSomaBN [-1,7] [1,7]
  testSomaBN [1,7] [1,7]
  putStrLn $ ""
  putStrLn $ "------Teste subBN(BigNumber, BigNumber)------"
  putStrLn $ ""
  testSubBN [-1,7] [9,5]
  testSubBN [1,7] [-9,5]
  testSubBN [1,7] [9,5]
  testSubBN [-1,7] [-9,5]
  testSubBN [-1,7] [1,7]
  testSubBN [1,7] [1,7]
  putStrLn $ ""
  putStrLn $ "------Teste mulBN(BigNumber, BigNumber)------"
  putStrLn $ ""
  testMulBN [-1,7] [-2]
  testMulBN [1,7] [2]
  testMulBN [1,7] [0]
  testMulBN [1,2] [1,1]
  testMulBN [1,2] [-1,1]
  testMulBN [0] [-1,7]
  putStrLn $ ""
  putStrLn $ "------Teste divBN(BigNumber, BigNumber)------"
  putStrLn $ ""
  testDivBN [1,7] [2]
  testDivBN [1,7] [1]
  testDivBN [1] [1,7]
  testDivBN [1,7] [1,5]
  testDivBN [5,6,0] [1,7]
  testDivBN [5,6,1] [1,7]
  putStrLn $ ""
  putStrLn $ "------Teste safeDivBN(BigNumber, BigNumber)------"
  putStrLn $ ""
  testSafeDivBN [1,7] [2]
  testSafeDivBN [1,7] [1]
  testSafeDivBN [1] [1,7]
  testSafeDivBN [1,7] [1,5]
  testSafeDivBN [5,6,0] [1,7]
  testSafeDivBN [5,6,1] [1,7]
  testSafeDivBN [1,7] [0]

testScanner :: String -> IO()
testScanner s = do
  putStrLn $ "String = " ++ s ++ "  ->  " ++ "BigNumber = " ++ (show $ scanner s)

testOutput :: BigNumber -> IO()
testOutput n = do
  putStrLn $ "BigNumber = " ++ (show n) ++ "  ->  " ++ "String = " ++ (output n)

testVerificaBN :: BigNumber -> IO()
testVerificaBN n = do
  if (verificaBN n) then putStrLn $ (show n) ++ " é um BigNumber" else putStrLn $ (show n) ++ " não é um BigNumber"

testRemoveZero :: BigNumber -> IO()
testRemoveZero n = do
  putStrLn $ "BigNumber = " ++ (output n) ++ "  ->  " ++ "Novo BigNumber = " ++ (output $ removeZero n)

testMaiorQue :: BigNumber -> BigNumber-> IO()
testMaiorQue n m = do
  if (maiorQue n m) then putStrLn $ (output n) ++ " é maior que " ++ (output m) else putStrLn $ (output n) ++ " não é maior que " ++ (output m)

testSomaBN :: BigNumber -> BigNumber -> IO()
testSomaBN n m = do
  putStrLn $ (output n) ++ " + " ++ (output m) ++ " = " ++ (output $ somaBN n m)

testSubBN :: BigNumber -> BigNumber -> IO()
testSubBN n m = do
  putStrLn $ (output n) ++ " - " ++ (output m) ++ " = " ++ (output $ subBN n m)

testMulBN :: BigNumber -> BigNumber -> IO()
testMulBN n m = do
  putStrLn $ (output n) ++ " * " ++ (output m) ++ " = " ++ (output $ mulBN n m)

testDivBN :: BigNumber -> BigNumber -> IO()
testDivBN n m = do
  putStrLn $ (output n) ++ " / " ++ (output m) ++ " = Quociente: " ++ (output $ fst w) ++ " Resto: " ++ (output $ snd w) where w = divBN n m

testSafeDivBN :: BigNumber -> BigNumber -> IO()
testSafeDivBN n m = do
  putStrLn $ (output n) ++ " / " ++ (output m) ++ " = (Quociente, Resto): " ++ (show w) where w = safeDivBN n m

comparaFibInt :: Int -> IO ()
comparaFibInt n = do
  putStrLn $ "n = " ++ (show n) ++ ":"
  if (n<30) then (putStrLn $ "FibRec: " ++ (show $ fibRec n)) else (putStrLn $ "FibRec: Número demasiado grande para calculcar recursivamente")
  putStrLn $ "FibLista: " ++ (show $ fibLista n)
  putStrLn $ "FibListaInfinita: " ++ (show $ fibListaInfinita n )

comparaFibInteger :: Integer -> IO ()
comparaFibInteger n = do
  putStrLn $ "n = " ++ (show n) ++ ":"
  if (n<30) then (putStrLn $ "FibRec: " ++ (show $ fibRec n)) else (putStrLn $ "FibRec: Número demasiado grande para calculcar recursivamente")
  putStrLn $ "FibLista: " ++ (show $ fibLista n)
  putStrLn $ "FibListaInfinita: " ++ (show $ fibListaInfinita n )

comparaFibBN :: BigNumber -> IO()
comparaFibBN n = do
  if (maiorQue [3,0] n) then (putStrLn $ "FibRecBN: " ++ (output $ fibRecBN n)) else (putStrLn $ "FibRecBN: Número demasiado grande para calculcar recursivamente")
  putStrLn $ "FibListaBN: " ++ (output $ fibListaBN n)
  putStrLn $ "FibListaInfinitaBN: " ++ (output $ fibListaInfinitaBN n )
