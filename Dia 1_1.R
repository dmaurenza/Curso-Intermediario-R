###### Revisão de conceitos básicos
# Nesta aula, faremos uma revisão sobre algumas funções básicas do R. Veremos como utilizar o R para fazermos operações matemáticas, quais são as principais classes de objetos e como altera-las. Também veremos o que são e como criamos vetores, matrizes, dataframes e listas

### Operações matemáticas

# No R podemos fazer operações matemáticas similares aos encontrados em uma calculadora convencional

# soma
5 + 5 

# subtração
10 - 5 

# divisão
10 / 2 

# multiplicação
5 * 2 

# raiz quadradra
sqrt(x = 15)

# elevar a um expoente
5^2

# pi
pi 


# Na programação nomeamos os objetos para que possamos utiliza-los posteriormente. Você pode nomear um objeto através dos operadores "<-" ou "=", A primeira forma é a mais fácil de ser interpretada, e não se confunde com "=" utilizado nos argumentos, além de haver o atalho "Alt" + "-".

resultado <- 5 + 5
resultado

# Exercício -----

# 1. Qual a raiz quadrada 9 + soma de 3 com 5?
# Dica: Utilize parenteses para facilitar a interpretação.


# 2. Armazene o resultado do exercício 1 em objeto chamado "resultado", e multiplique por "pi"

resultado * pi



### Classes de objetos
# Existem diversas classes de objetos que podemos criar, mas os mais comumente utilizadas são "Numeric", "Character", "Interger", "logical" e "double". Vamos ver na prática essas classes, como perguntamos ao R qual é a classe de um objeto, e como alteramos a classe de um objeto

class(x = 5)
class(resultado)

ola <- "Olá alunos Bud!"
class(x = ola )

# o 5 é um número?

is.numeric(x = 5) 

# o 5 é um caractere?
is.character(x = 5)


# a expressão "Olá alunos Bud!" é formada por caracteres?
is.character(x = "Olá alunos Bud!")


# o número 5 é inteiro?
is.integer(x = 5) 


# o número 5 é inteiro?
is.integer(x = 5L) 

# O R não sabe se o número 5 é inteiro pois, na ‘concepção’ dele, pode haver uma casa decimal em algum ponto que não o caracterize como número inteiro. Portanto, você precisa adicionar o “L” ao lado dele para que o R entenda.

# Por conta dessa incerteza, o R também classifica os números como um objeto da classe "double", que pode ser um número inteiro ou contínuo.

a <- is.double(x = 5)

b <- is.double(x = 5L)

# Logical, também conhecido como boolean, é uma classe de objeto muito usado nas indexações (veremos indexações mais adiante)

c <- 5
is.logical(a)
is.logical(b)
is.logical(c)

class(c)

# Nós podemos forçar/converter/transformar uma classe de um objeto, usando "as."
inteiro <- is.integer(x = 5) 
class(inteiro)
inteiro <- as.integer(x = 5)
class(inteiro)

# Outro exemplo

class(5)

char <- as.character(5)
class(char)

char_num <- as.numeric(char)
class(char_num)

# 1. Qual a raiz quadrada 9 + soma de 3 com 5?
#   Dica: Utilize parenteses para facilitar a interpretação.
# 
# 2. Armazene o resultado do exercício 1 em objeto chamado "resultado", e multiplique por "pi"
# 
# 3. Nomeie um objeto com o número 5 como “n_5”. Pergunte ao R qual a classe do objeto n_5. Faça com que o “n_5” seja um objeto da classe “caractere”

#resultado <-  9+(3+5)

# resultad * pi

n_5 <- 5
class(n_5)
n_5 <- as.character(n_5)
class(n_5)

### Vetores 
# Até o momento estamos trabalhando com objetos que armazenam e/ou assumem um único valor, mas muitas vezes estamos interessados em armazenar um conjuntos de valores.

# Podemos juntar diferentes valores  através da função "c", que refere-se à abreviação de "concatenar". Para este objeto, damos o nome de vetor.

c(1, 2, 3, 4, 5, 6)

# Vamos por exemplo criar um objeto com a idade de um conjunto de pessoas

idade <- c(27, 24, 22, 29, 23)


# qual a classe do objeto idade?
class(x = idade)

# o objeto idade é um vetor?
is.vector(x = idade)

# adicionando valores ao vetor

idoso <- 70
idade
idoso
idade <- c(idade, idoso)


is.vector(idade)

# criando um vetor concatenando objetos da classe caractere

frutas <- c("banana", "maça", "laranja", "manga", "uva")

class(frutas)

is.vector(frutas)

limao <- "limão"

frutas

limao

frutas <- c(frutas, limao)

# um valor da classe "numeric" pode ser transformado em "character", mas um "character" não pode ser transformado em um "numeric"

idade_fruta <- c(idade, frutas)

class(idade_fruta)

is.vector(idade_fruta) 

### Matrizes 
# Um conjunto de vetores pode ser organizado dentro de uma matriz, criada a partir da função "matrix". A matriz pode ser criada a partir de um vetor, determinando quantas linhas e quantas colunas ela deve assumir.Uma matriz pode ser preenchida por linhas (byrow = TRUE) ou por colunas (byrow = FALSE)

matrix(idade)

matrix(idade, nrow = 2, ncol = 3)

matrix(idade, nrow = 3, ncol = 2)

matrix(idade, nrow = 2, ncol = 3, byrow = T)

matrix(idade, nrow = 2, ncol = 3, byrow = F)

# Você também pode montar uma matriz a partir de dois ou mais vetores:
altura <- c(1.75, 1.56, 1.67, 1.70, 1.62, 1.77)
altura
idade

idade_altura <- matrix(data = c(idade, altura), nrow = 6, ncol = 2, byrow = FALSE)
idade_altura


idade_altura_fruta <- matrix(data = c(idade_altura, frutas),nrow = 6, ncol = 3, byrow = FALSE)

# No código podemos omitir algumas informações.
matrix(data = c(idade_altura, frutas),nrow = 6, byrow = FALSE)
?matrix

matrix(data = c(idade_altura, frutas))


### Dataframes
# O tipo de objeto mais utilizado nas análises de dados são os dataframe, criado pela função data.frame. Um dataframe é uma tabela similar às que criamos em excel, com duas dimenções, as linhas e as colunas. Ao contrário da matriz, o dataframe pode comportar diferentes tipos de objetos, desde que esteja em colunas distintas.

# um vetor com nomes
nomes <- c("Joana", "Joao", "Maria", "Pedro", "Ana", "Paulo")
# um vetor lógico
logico <- c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE)
# um data frame
idade

# Um data.frame com estes 3 vetores

dados <- data.frame(idade, nomes, logico)

dados

# Veja que é possível nomear as linhas

nome_linha <- c("a", "b", "c", "d", "e", "f")

dados <- data.frame(idade, nomes, logico, row.names = nome_linha)
dados

# Existem outras formas para criarmos um dataframe

df_idade_altura <- as.data.frame(idade_altura)
df_idade_altura

#Ué, porque apareceram nomes de colunas V1 e V2? Para criarmos tanto matrix como data.frame, utilizamos os vetores idade e altura. Porém, ao contrário das matrizes, os data.frames tornam o nome dos vetores como nome das colunas. Isso ocorre porque se não informarmos o número de colunas na função matrix, o R não sabe qual seria o nome da coluna esperada. Veja:

matrix(data = c(idade_altura),ncol = 2, byrow = FALSE)
matrix(data = c(idade_altura),ncol = 3, byrow = FALSE)


# Podemos solucionar este problema com a função "colnames"

colnames(idade_altura)

colnames(idade_altura) <- c("idade", "altura")
idade_altura

#Similarmente, podemos nomear as colunas do data.frame

colnames(df_idade_altura)
colnames(df_idade_altura) <- c("idade", "altura")
df_idade_altura

# Podemos adicionar novas colunas e linhas, por meio das funções cbind e rbind, respectivamente

# "cbind" adiciona colunas
df_idade_altura_frutas_cbind <- cbind(df_idade_altura, frutas)
df_idade_altura_frutas_cbind

# "rbind" adiciona linhas
df_idade_altura_frutas_rbind <- rbind(df_idade_altura_frutas_cbind, c(25, 1.80, "melancia"))
df_idade_altura_frutas_rbind

### Listas
# Uma outra forma de armazenar dados é através da criação de listas com a função "list". Cada elemento de uma lista pode ser um vetor, matriz ou outro tipo de objeto (inclusive, outra lista). A ideia central da lista é que ela salva cada elemento em uma ‘dimensão’ diferente.

idade
nomes
dados
df_idade_altura

coisas <- list(idade, nomes, dados, df_idade_altura)
coisas

# Exercicios
# 4. Qual é a diferença entre a matrix idade_altura e a matrix idade_altura_fruta? Dica, veja a aba "ambiente" do RStudio!
#   
# 5. Crie dois vetores com uma informação que você desejar; Crie um data.frame contendo a informação destes dois vetores; Adicione uma nova coluna ao data.frame criado; Coloque tudo isto em uma lista
