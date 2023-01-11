# Curso R Intermediário - Bud 
# Dia 2; parte 2

# Indexação Lógica -----


# Mas antes, vamos aprender a ferramenta "Project". 
# Project é uma ferramenta que auxilia a organização dos dados. Ele garante que todos os scripts gerados sejam organizados na mesma pasta. 
# A ferramenta project também facilita o compartilhamento dos scripts e dados com outras pessoas, evitando erros comuns relacionados aos caminhos dos arquivos.
# vamos ver isso na prática:

getwd()

#a função set working directory "setwd" define a pasta master: todas as funções seguidas se referem ao conteúdo dessa pasta

setwd("D:/")
getwd()

# Indexação Lógica -----

# Apesar de reter ou eliminar posições específicas de um objeto no R ser algo útil, na maior parte das vezes queremos realizar esta tarefa para conjuntos dos dados que cumpram certos requerimentos (por exemplo, reter apenas as observações de uma determinada categoria).
# Uma forma de fazer isto é através de testes lógicos.

# o número 4 é maior do que o 5?
4 > 5

# um número 4 é menor do que o 5?
4 < 5

# o número 4 é igual ao 5?
4 == 5

# o número 4 é diferente do 5?
4 != 5

# uma palavra é igual a outra?
"Ola" == "Tchau"
"Ola" == "Ola"

# uma palavra é diferente da outra?
"Ola" != "Tchau"
"Ola" != "Ola"


# Podemos também selecionar elementos que cumprem com uma ou mais condições:

# o número 4 é maior que o 5 E é menor que o 3?
4 > 5 & 4 < 3

# o número 4 é menor que o 5 E é maior que o 3?
4 < 5 & 4 > 3

# o número 4 é maior do que 5 OU é menor do que 3?
4 > 5 | 4 < 3

# o número 4 é menor do que 5 OU é menor do que 3?
4 < 5 | 4 > 3


# Operações condicionais em vetores. Primeiro, vamos criar uma amostra de valores com distribuição normal

vetor1 <- seq(from = 23, to = 34, 
              length.out = 100)

media <- mean(x = vetor1)

desvio <- sd(x = vetor1)

amostra1 <- rnorm(n = 20, mean = media,
                  sd = desvio)
length(amostra1)

#Agora vamos fazer algumas operações lógicas

# quais elementos do vetor amostra são maiores que 28?
amostra1 > 25

# quais elementos do vetor amostra são menores ou iguais a 32?
amostra1 <= 32


# Podemos usar a mesma lógica para retermos caracteres que assumam determinados valores:

# criando uma sequência de letras de "A" a "J" para representar quadrantes de amostragem

quadrats1 <- rep(LETTERS[1:10], each = 2)

# quais letras são iguais a "A"
quadrats1 == "A"

#quais letras não são iguais a "A"
quadrats1 != "A"

# Vamos fazer alguns exercícios juntos
# Quais elementos do vetor amostra1 são menores do que 31 e maiores do que 29?
# Quais elementos do vetor amostra1 são maiores de 25 (inclusive) ou menores do que 33?

amostra1 < 31 & amostra1 > 29
amostra1 < 31
amostra1 > 29


amostra1 >=25 | amostra1 < 29 
amostra1 >=25
amostra1 < 29


# Uma coisa importante a se notar é que ao fazermos estes testes, o resultado retornado é um vetor.

# quais os valores do amostra1 maiores que 28?
maior28 <- amostra1 > 28

# este teste lógico é um vetor?
is.vector(x = maior28)


# Portanto, podemos usar estes testes lógicos para indexar vetores também.

amostra1[maior28]

# outra forma de fazer isso:
amostra1[amostra1 > 28]


# Também podemos usar um vetor para indexar um outro vetor, desde que eles tenham o mesmo tamanho.


# quais as categorias de letras são iguais a "B"?
letraB <- quadrats1 == "B"

length(letraB)
length(amostra1)

# quais os elementos do vetor1 pertencem à categoria letra "B"?
amostra1[letraB]


# Crie um vetor de número de 1 a 100 e guarde este vetor em um objeto.
# Crie um segundo vetor com duas categorias: “impar” e “par” (nesta ordem), e guarde em um objeto.
# Faça com que os valores “impar” e “par” sejam repetidos 50 vezes, de forma intercalada (“impar”, “par”, “impar”, “par”, …); guarde isso em um objeto.
# Indexe o vetor criado no passo “a” de forma que somente os números em posição par sejam apresentados.

sequencia <- 1:100
impar_par <- c("impar", "par")
impar_par_100 <- rep(impar_par, times = 50)


impar_par_100 == "par"
sequencia[impar_par_100 == "par"]


# O que este último exercício nos mostra é que podemos usar condições relacionadas a um vetor para indexar valores em um outro vetor. Isto é um passo importante para entendermos as operações condicionais em um data.frame.



# Operações condicionais em data.frame -----

# Muito frequentemente, ao trabalharmos com a indexação de um data.frame, o nosso objetivo é selecionar, ou excluir, as linhas que satisfaçam uma ou mais condições.
# 
# Estas linhas correspondem a um conjunto de observações que descrevem um conjunto particular de dados.
# 
# Para entender melhor as operações condicionais em um data.frame, vamos usar nossa tabale "Alunos".


# Você pode se lembrar que uma das formas de indexarmos um data.frame é como em um jogo de batalha naval: dados[linhas, colunas].

alunos <- read_csv("dados/alunos_alterado.csv")

alunos[c(10:15), c(2:3)]


# Como vimos ainda pouco, esta o modo como essa indexação é feita é pelo fornecimento de um vetor para cada lado da vírgula, que determina as posições a serem retidas.
# 
# 
# Podemos usar isso em nosso favor, mas primeiro precisamos lembrar como indexar uma coluna de um data.frame através do operador $.

# retorna um vetor com as classes de sexo
alunos$sexo
# retorna um vetor com os valores de idade
alunos$idade
# retorna um vetor com os números do tamanho dos pé
alunos$pe


#Note que, em todos os casos, ao usarmos o operador $ estamos indexando uma coluna e tendo como resultado um vetor.

masculino <- alunos$sexo == "M"
masculino

# se quiséssemos indexar o vetor masculino dentro do data.frame alunos...

alunos$sexo[masculino]


# Acabamos de ver que podemos usar uma operação de lógica em um vetor para filtrar outro vetor. Como podemos aplicar isto a um data.frame então?
# 
# Lembre-se que um data.frame “conhece” os vetores que o compõe!

# se quiséssemos indexar apenas as linhas que correspondem ao sexo masculino

alunos[alunos$sexo == "M",]

# podemos ainda determinar quais colunas queremos também reter
alunos[alunos$sexo == "M", c(1:5)]


# Podemos extender o uso da indexação para mais de uma condição:

# retendo todas as observações que correspondam aos alunos do semestre 3 OU  4

alunos[alunos$semestre == 3 | alunos$semestre == 4, ]

alunos[alunos$semestre == 3:4, ]

# # retendo todas as observações que correspondam aos alunos acima do semestre 3 OU cujos alunos tenham mais que 25 anos de idade
alunos[alunos$semestre > 3 | alunos$idade > 25, ]

# # retendo todas as observações que correspondam aos alunos acima do semestre 3 E cujos alunos tenham mais que 25 anos de idade
alunos[alunos$semestre > 3 & alunos$idade > 25, ]

# # retendo todas as observações que correspondam aos alunos acima do semestre 3 E abaixo do semestre 8

alunos[alunos$semestre > 3 & alunos$semestre < 8, ]


# # retendo todas as observações que correspondam aos alunos acima do semestre 3 E cujos alunos tenham mais que 25 anos de idade E que sejam homens.

alunos[alunos$semestre > 3 & alunos$idade > 25 & alunos$sexo == "M", ]


# Exercício
#

# 1. Indexe, ou selecione, todas as linhas de "alunos" cujo valor da coluna peso seja maior do que 65 (inclusive);
# 2. Selecione todas as linhas de "alunos" que correspondam às mulheres da turma, mas removendo as colunas "semestre", "pe", "mao" e "iniciante".

# 1.

condicao_peso <- alunos$peso >= 65
alunos[condicao_peso, ]

alunos[alunos$peso >= 65,]

# 2.
colnames(alunos)
alunos[alunos$sexo == "M", -c(7:10)]
alunos[alunos$sexo == "M", c(1:6)]
alunos[alunos$sexo == "M", c("nome", "idade", "sexo", "altura", "peso", "transporte")]




# Retenha uma única linha que corresponde à você, e as colunas nome, idade, sexo e altura, mediante as seguntes regras:
#   - não use a coluna nome (ex. alunos$nome == "Daniel Maurenza de Oliveira").
#   - utilize pelo menos 3 comandos distintos para selecionar a linha.
#   - o penúltimo comando deve selecionar mais do que uma linha única.

# daniel <- c("Daniel Maurenza de Oliveira", 39, "M", 1.7, 72, "Publico", 8, 40, 22, TRUE)
# 
# alunos <- rbind(alunos, daniel)


alunos$sexo == "M"
alunos$iniciante == T
alunos$idade > 35

alunos[alunos$sexo == "M" & alunos$iniciante == T & alunos$idade > 35 , 1:4]

# Por fim, vamos aprender a operação condicionante "ifelse". ifelse usa um teste lógico para executar uma ação:
# 1. Dado um teste lógico;
# 2. Faça yes caso ele seja verdadeiro;
# 3. Faça no caso ele seja falso.


args(ifelse)

# Primeiramente, vamos ver como ifelse funciona com vetores

vetor1 <- 20:30

ifelse(test = vetor1 <= 23, yes = "baixo", no = "alto")

# Vamos usar uma tabela de dados que já existe no seu R: airquality. Daily air quality measurements in New York, May to September 1973.

temp <- airquality$Temp

temp

range(temp)

temp_class <- ifelse(test = temp > 70,yes = "quente", no = "frio")

temp_class


# Agora vamos usar nossa tabela alunos

mao <- alunos$mao

ifelse(test = mao >= 21, yes = "maozão", no = "maozinha")

# Você pode encadear diversos testes e substituições lógicos, mas cuidado - isto tende a se tornar cada vez mais complexo!

ifelse(test = mao >= 23, yes = "maozão", no = ifelse(test = mao < 23 & mao >= 21, yes = "regular", no = "maozinha"))


# Agora, vamos ver como ifelse funciona com data.frames

classe_mao <- ifelse(test = alunos$mao >= 21, yes = "maozão", no = "maozinha")

# No data.frame, podemos criar uma nova coluna, ou substituir a coluna existente:

alunos$mao_classe <- ifelse(test = alunos$mao >= 21, yes = "maozão", no = "maozinha")
alunos


alunos$mao <- ifelse(test = mao >= 23, yes = "maozão", no = ifelse(test = mao < 23 & mao >= 21, yes = "regular", no = "maozinha"))
alunos

# Exercício

# Usando a função ifelse, crie uma nova coluna representando a classe de altura. Classifique alunos menores que 1.6m como "baixo", alunos iguais ou maiores que 1.6 e menores que 1.9 como "médio", e alunos maiores ou iguais a 1.9m como "alto".



# Para casa

# Vamos usar uma tabela de dados que já existe no seu R: airquality. Primeiramente, explore o seu conteúdo e estrutura utlizando as funções help e str.
#
 
data(airquality)
airquality

str(airquality)


# Com ela, retenha todas as colunas cujas linhas pertençam ao mês 8;

month_8 <- airquality[airquality$Month == 8,]

# Agora, retenha todas as linhas cuja temperatura seja maior que 70 E a concentração de ozônio maior do que 80;

month_8_temp_ozone <- month_8[month_8$Temp > 70 & month_8$Ozone > 80,]
 
# Retenha todas as observações que tenham a velocidade do vento maior do que 10 E menor do que 15 OU cuja temperatura seja maior ou igual a 86;

month_8_temp_ozone_wind <- month_8_temp_ozone[(month_8_temp_ozone$Wind > 10 & month_8_temp_ozone$Wind < 15 )| month_8_temp_ozone$Temp >= 86,]

# Por fim, retenha todas as linhas cujo ozônio seja maior do 100, a radiação solar seja menor do que 230 e que a temperatura seja maior ou igual a 90.

final <- month_8_temp_ozone_wind[month_8_temp_ozone_wind$Ozone > 100 & month_8_temp_ozone_wind$Solar.R> 230 & month_8_temp_ozone_wind$Temp >= 90,]

final
