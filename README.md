# PFL
>Descrição de vários casos de teste para todas as funções

>uma explicação sucinta do funcionamento de cada função
>
**BigNumber.hs**

|Função| Descrição|
|------| ---------|
|*scanner*|Esta função verifica se o número recebido em forma de String é negativo ou não multiplicando por -1 caso seja o resultado obtido da conversão de String para BigNumber. Para realizar a conversão recorre a duas funções auxiliares *charToInt* e *scanner'*.|
|*scanner'*| Esta função converte a cabeça da lista para inteiro, com a ajuda da segunda função auxiliar *charToInt*, chamando posteriormente a si mesma de forma recursiva até converter todos os elementos da lista.|
|*charToInt*|Esta função faz a associação entre o valor da string com o valor numérico através do uso de (não me lemnbro como aquilo se chama). Caso receba na string algum valor que não seja um inteiro, esta retorna erro.|
|*output*| Esta função verifica se o BigNumber recebido é positivo ou negativo, acrescentando "-" à string caso seja negativo. Realiza a conversão de BigNumber para string recorrendo a duas funções auxiliares *output'* e *intToChar*.|
|*output'*|Esta função converte a cabeça da lista para string, com a ajuda da segunda função auxiliar *intToChar*, concatenando esta com a chamada recursiva a si mesma até converter todos os elementos da lista.|
|*intToChar*|Esta função faz a associação entre o valor númerico com o valor da string através do uso de (não me lemnbro como aquilo se chama). Caso receba no BigNumber algum valor que não seja um inteiro, esta retorna erro.|
|*removeZero*| Função auxiliar para eliminar os zeros à esquerda.|
|*maiorQue*| |
|*adicionaSinal*||
|*somaBN*||
|*somaBNAux*||
|*somaBNAux1*||
|*subtrairBNAbs*||
|*subBN*|Esta função calcula a subtração através da soma entre primeiro número e o simétrico do segundo|




> as estratégias utilizadas na implementação das funções da alínea 2




>Exercício 4

| Função | Número | Tempo médio de execução|
|--------|--------|-------------|
|fibRec  | 30     |3.404|
|fibRecBN |30 |23.182|
|fibLista | 10000 | 0.515|
|fibListaBN| 10000 ||
|fibListaInfinita| ||
|fibListaInfinitaBN|||
