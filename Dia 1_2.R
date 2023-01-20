# Nesta aula veremos o que é indexação, seus objetivos e como fazer as indexações no R, sejá em vatores ou dataframes


## Indexando Vetores 
    
# Indexação é a ação de extrair um elemento específico, ou um conjunto de elementos, de um objeto. Podemos extrair sub-conjuntos específicos de dados de acordo com as ‘coordenadas’ dos dados que buscamos, assim como em um jogo de batalha naval.

#Utilizaremos três tipos de operadores para realizar a indexação:
      
# [] extrai um ou mais elementos em vetores, listas, ou data.frame;
    
# [[]] extrai um ou mais elementos em listas ou data.frame;

# $ extrai elementos pelo nome em listas e data.frame.
    

#  Para exemplificarmos um vetor, vamos aprender a função "seq()"

vetor1 <- seq(from = 1, to = 100)

vetor1

# podemos definir o incremento, utilizando a função by

vetor2 <- seq(from = 1, to = 100, by = 2)

vetor2

# também podemos definir o tamanho
vetor3 <- seq(from = 1, to = 100, length.out = 50)

vetor3

# uma forma abreviada e muito utilizada da função seq

vetor4 <- 1:100

vetor4

# Antes de executar o comando, tente acertar.
# Qual o resultado obtido pelo comando de vetor5 <- 50:1

vetor5 <- 50:1

vetor5

vetor6 <- 50:-50

vetor6

# Agora sim, vamos aprender como fazer uma indexação. Mas o que é a indexação? é a forma de extrair o valor atravéz da sua posição. Por exemplo, qual é o valor na posição (index) 16 do vetor1?
  

vetor1[16]

vetor1

# Qual é o valor na posição (index) 16 do vetor2?
  
vetor2[16]

# Quais os valores nas posições de 16 à 21 do vetor2?
  
vetor2[c(16, 17, 18, 19, 20, 21)]

#Lembram da função "seq()"? Podemos utilizá-la nas indexações

vetor2[16:21]

# Da mesma forma como podemos selecionar os elementos que buscamos, podemos selecionar aqueles elementos que não buscamos!

vetor1

vetor1[-2]

# Para excluirmos uma sequência contínua de valores devemos concatenar estes valores primeiro, caso contrário o R não entende que queremos eliminar uma sequência de posições.

vetor1[-c(10:20)]

# também funciona
vetor1[-(10:20)]

vetor1[-10:-20]

# Uma forma muito útil de indexação é utilizar um outro objeto criado anteriormente

numero <- 16:21

vetor1[numero]

vetor3[numero]


# Neste caso, a indexação está usando um objeto que indicamarcam as posição dos elementos a serem retidos. Assim, poderíamos criar um vetor com números representando posições específicas que buscamos reter

numero <- c(1, 5, 7, 9)

vetor1[numero]

vetor1[-numero]

# Também é possível indexar caracteres

letters

letters[1:10]

letters[-c(1:10)]

# Por fim, podemos subtituir valores através da indexação de duas formas:

letters[1:5] <- c("A", "B", "C", "D", "E")

letters

top_5_numbers <- c("1", "2", "3", "4", "5")

letters[1:5] <- top_5_numbers

letters

# Exercícios

# Utilizando o vetor1, faça uma indexação que retorne:
# Os cinco primeiros elementos;
# Os elementos nas posições 10, 12, 14, 16, 18 e 20;
# Os cinco primeiros elementos e os elementos nas posições 10, 12, 14, 16, 18 e 20;
# Substitua os 5 primeiros numeros do vetor1 pelas 5 primeiras letras do alfabeto

x <- vetor1[1:5]
y <- vetor1[c(10, 12, 14, 16, 18, 20)]
vetor1[c(x, y)]
vetor1[1:5] <- letters[1:5]

### Indexando Dataframes 

# Lembre-se que um dataframe possui duas dimensões: linhas e colunas. A indexação do data.frame deve então considerar estas duas dimensões; A metáfora do jogo de batalha naval é especialmente válida para um dataframe: [linha, coluna]

# Criando um data frame

# vetor 1
vetor1 <- 1:34

vetor1

# vetor 2
vetor2 <- seq(from = 0, to = 100, length.out = 34)

vetor2

# A função "rep()" repete os valores indicados, e possui um argumento chamado "times", que define quantas vezes o valor indicado deve ser repetido

letras <- rep(c("A", "B"), times = 17)

letras

# juntando os tres vetores em um dataframe
dados <- data.frame(vetor1, vetor2, letras)

dados


# Para indexar um dataframe, utilizamos os colchetes separados por uma virgula. A posição antes da virgula expressa a posição da linha. A posição após a virgula expressa a posição da coluna


dados[1,]

dados[,3]

dados[1,3]

# podemos usar o operaror [[]] para indexar as colunas de um data.frame
dados[[2]]


# Podemos indexar um conjunto de dados em um dataframe através do nome da coluna, da posição da coluna, ou utilizando o operador $.

# Usando o nome

colnames(dados)

dados[, c("vetor2", "letras")]
# Usando a posição

dados[,2:3]

# Usando o operador $
dados$letras


# Dica do RStudio: ao tentar indexar um objeto através do uso do $, digite o nome do objeto, adicione o $ e pressione Tab - todos os elementos que compõem a estrutura daquele elemento estarão disponíveis.

# Assim, Você pode se lembrar que uma das formas de indexarmos um data.frame é como em um jogo de batalha naval: dados[linhas, colunas].


dados[10:20, 2:3]


# Similarmente às indexações de vetores, podemos eliminar linhas e colunas de data.frames

dados[-c(10:20),]

dados[,-c(2:3)]

dados[-c(10:20), -c(2:3)]



#   2. Usando o data.frame dados:
#   - Selecione as linhas de número 3, 12, 18 e 25, retendo todas as colunas;
# - Elimine apenas a coluna 2;
# - Elimine as linhas 15 a 30 e a coluna 2.
# 
# ##### Desafio
# - Adicione uma quarta coluna chamada vetor3 ao data.frame "dados" repetindo a letra "C" e "D"


dados[c(3, 12, 18, 25),]
dados[,-2]
dados[-c(15:30), -2]
dados[,"vetor3"] <- rep(c("C","D"), times = 17)
dados


# Para casa - Preencher a tabela alunos
