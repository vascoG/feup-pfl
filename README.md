# PFL
>Descrição de vários casos de teste para todas as funções

>uma explicação sucinta do funcionamento de cada função
>
**BigNumber.hs**

|Função| Descrição|
|------| ---------|
|*scanner*|Esta função realiza a conversão  de String para BigNumber recorrendo a duas funções auxiliares *charToInt* e *scanner'*.|
|*scanner'*| Esta função converte a cabeça da lista para inteiro, com a ajuda da segunda função auxiliar *charToInt*, chamando posteriormente a si mesma de forma recursiva até converter todos os elementos da lista.|
|*charToInt*|Esta função faz a associação entre o valor da string com o valor numérico através do uso de (não me lemnbro como aquilo se chama). Caso receba na string algum valor que não seja um inteiro, esta retorna erro.|
|*output*| Esta função realiza a conversão de BigNumber para string recorrendo a duas funções auxiliares *output'* e *intToChar*.|
|*output'*|Esta função converte a cabeça da lista para string, com a ajuda da segunda função auxiliar *intToChar*, concatenando esta com a chamada recursiva a si mesma até converter todos os elementos da lista.|
|*intToChar*|Esta função faz a associação entre o valor númerico com o valor da string através do uso de (não me lemnbro como aquilo se chama). Caso receba no BigNumber algum valor que não seja um inteiro, esta retorna erro.|
|*removeZero*| Função auxiliar para eliminar os zeros à esquerda.|
|*maiorQue*| Esta função verifica qual a lista maior entre as duas que recebe, retorna True se a primeira for maior e false se for menor.|
|*adicionaSinal*|Esta função adiciona o sinal negativo ao BigNumber.|
|*somaBN*|Esta função calcula a soma entre 2 BigNumbers. Utiliza 3 funções auxiliares *somaBNAux*, *somaBNAux1* e *subtrairBNAbs* de forma a calcular a soma de forma correta para todos os casos possíveis.|
|*somaBNAux*||
|*somaBNAux1*||
|*subtrairBNAbs*||
|*subBN*|Esta função calcula a subtração através da soma entre primeiro número e o simétrico do segundo.|
|*mulBN*|Esta função calcula a multiplicação entre 2 BigNumbers. Utiliza 3 funções auxiliares *mulBNAux*, *mulBNAux1* e *escalaBN*.|
|*mulBNAux*|||
|*mulBNAux1*|||
|*escalaBN*|||
|*divBN*|Esta função calcula a divisão entre 2 BigNumbers. Utiliza uma função auxiliar *divBNAux*.|
|*divBNAux*|||

**fib.hs**

|Função| Descrição|
|------| ---------|
|*fibRec*|||
|*fibLista*|||
|*fibListaInfinita*|||
|*fibRecBN*|||
|*fibListaBN*|||
|*(@@)*|||
|*listRange*|||
|*fibListaInfinitaBN*|||




> as estratégias utilizadas na implementação das funções da alínea 2


No exercício 2 implementamos as seguintes funções: *scanner*, *output*, *somaBN*, *subBN*, *mulBN* e por fim *divBN*.
  <p>Primeiramente, a função *scanner*, como já foi dito anteriormente, realiza a conversão de uma String para um BigNumber. Para isso, esta função chama duas funções auxiliares, *scanner'* que converte a cabeça da lista para inteiro, com a ajuda da segunda função auxiliar *charToInt*, chamando posteriormente a si mesma de forma recursiva até converter todos os elementos da lista. A função *charToInt* faz a associação entre o valor da string com o valor numérico através do uso de (não me lemnbro como aquilo se chama).
  A função *output* segue a mesma estratégia que a função *scanner*, porém converte BigNumbers para Strings.</p>
<p> Posteriormente, a função *somaBN*, calcula a soma de dois BigNumbers.

>Exercício 4

| Função | Número | Tempo médio de execução|
|--------|--------|-------------|
|fibRec  | 30     |3.404|
|fibRecBN |30 |23.182|
|fibLista | 10000 | 0.515|
|fibListaBN| 10000 ||
|fibListaInfinita| ||
|fibListaInfinitaBN|||
