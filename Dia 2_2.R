## Ferramenta "Project" {#anchor1}

#A ferramenta "Project" nos garante que todos os scripts gerados sejam organizados na mesma pasta-master. Além de termos os arquivos mais organizados, isto  facilita o compartilhamento dos scripts e dados com outras pessoas, evitando erros comuns relacionados aos caminhos dos arquivos.

#Para sabermos onde nossos arquivos estão sendo salvos, usamos a função "getwd(), abreviação de Get Working Directory"

getwd()

# a função "setwd()", abreviação de Set Working Directory,  define a pasta-master. Ou seja, todas os arquivos se referem à essa pasta

setwd("D:/")
getwd()

# Usando a ferramenta "Project" (File > New Project > New Directory > New Project), nós definimos o nome do projeto e o caminho onde será armazenado no nosso computador (diretório). A partir de agora, basta incluirmos organizadamente todos os arquivos do nosso projeto dentro do diretório. 


## Indexação lógica ----

# Apesar de reter ou eliminar posições específicas de um objeto ser uma operação útil, na maior parte das vezes queremos realizar esta tarefa para conjuntos dos dados que cumpram certos requerimentos (por exemplo, reter apenas as observações de uma determinada categoria).

# Uma forma de fazer isto é através de operações lógicas. Para executar operações lógicas, utilizamos alguns caracteres especiais.

# O número 4 é maior do que o 5?
  
4 > 5

#O número 4 é menor do que o 5?
 
4 < 5

# O número 4 é igual ao 5?
  
4 == 5

# O número 4 é diferente do 5?
  
4 != 5

# Uma palavra é igual a outra?
  
"Ola" == "Tchau"

"Ola" == "Ola"

# Uma palavra é diferente da outra?
  
"Ola" != "Tchau"

"Ola" != "Ola"

## Operações condicionais em vetores ----

# Para exemplificar as operações condicionais, vamos criar uma amostra de valores com distribuição normal


vetor1 <- seq(from = 23, to = 34, 
              length.out = 100)
vetor1

media <- mean(x = vetor1)

desvio <- sd(x = vetor1)

amostra1 <- rnorm(n = 20, mean = media,
                  sd = desvio)
amostra1

length(amostra1)

#Agora vamos fazer algumas operações lógicas. 

#Quais elementos do vetor amostra1 são maiores que 28?
 
amostra1 > 25

#Quais elementos do vetor amostra são menores ou iguais a 32?
 
amostra1 <= 32

# Podemos usar a mesma lógica para retermos caracteres que assumam determinados valores.

# Para exemplificar, vamos criar uma sequência de letras de "A" a "J" para representar quadrantes de amostragem


quadrats1 <- rep(LETTERS[1:10], each = 2)

quadrats1

# Quais letras são iguais a "A"

quadrats1 == "A"

#Quais letras não são iguais a "A"

quadrats1 != "A"

# Vamos fazer alguns exercícios juntos

# 1. Quais elementos do vetor amostra1 são menores do que 31 e maiores do que 29?
  
#  2. Quais elementos do vetor amostra1 são maiores de 25 (inclusive) ou menores do que 33?
  
 
# 1.
amostra1 < 31

amostra1 > 29

amostra1 < 31 & amostra1 > 29

# 2.
amostra1 >=25

amostra1 < 29

amostra1 >=25 | amostra1 < 29


# É importante notar que ao fazermos estes testes, o resultado retornado é um vetor

maior28 <- amostra1 > 28

is.vector(maior28)


# Portanto, podemos usar estes testes lógicos para indexar vetores também

amostra1[maior28]

# outra forma de obter o mesmo resultado
amostra1[amostra1 > 28]


# Também podemos usar um vetor para indexar um outro vetor, desde que eles tenham o mesmo tamanho.

#Quais as categorias de letras são iguais a "B"?
 
letraB <- quadrats1 == "B"

letraB

#Quais os elementos do vetor1 pertencem à categoria letra "B"?
 
amostra1[letraB]


# 1. Crie um vetor de número de 1 a 100 e guarde este vetor em um objeto.
# 
# 2. Crie um segundo vetor com duas categorias: “impar” e “par” (nesta ordem), e guarde em um objeto.
# 
# 3. Faça com que os valores “impar” e “par” sejam repetidos 50 vezes, de forma intercalada (“impar”, “par”, “impar”, “par”, …); guarde isso em um objeto.
# 
# 4. Indexe o vetor criado no passo “1” de forma que somente os números em posição par sejam apresentados.

sequencia <- 1:100
impar_par <- c("impar", "par")
impar_par_100 <- rep(impar_par, times = 50)


impar_par_100 == "par"
sequencia[impar_par_100 == "par"]

## Operações condicionais em dataframes ----

# Este último exercício nos mostra que podemos usar condições relacionadas a um vetor para indexar valores em um outro vetor. Isto é um passo importante para entendermos as operações condicionais em um dataframe.

# Muito frequentemente, ao trabalharmos com a indexação de um dataframe, o nosso objetivo é selecionar, ou excluir, as linhas que satisfaçam uma ou mais condições.

# Estas linhas correspondem a um conjunto de observações que descrevem um conjunto particular de dados. Para entender melhor as operações condicionais em um dataframe, vamos usar nossa tabela de Alunos

library(tidyverse)
alunos <- read_csv("dados/alunos_alterado.csv")

# Você deve se lembrar que uma das formas de indexarmos um dataframe é como em um jogo de batalha naval: dados[linhas, colunas].

alunos[c(1:3), c(2:3)]

# Como vimos ainda pouco, par indexarmos dataframes fornecemos um vetor para cada lado da vírgula, determinando assim as posições a serem retidas. Podemos usar isso em nosso favor para fazermos operações lógicas em dataframes

# Mas primeiro, vamos lembrar como indexar uma coluna de um dataframe através do operador $.

# retorna um vetor com as classes de sexo
alunos$sexo
# retorna um vetor com os valores de idade
alunos$idade
# retorna um vetor com os números do tamanho dos pé
alunos$pe

# Note que, em todos os casos, ao usarmos o operador $ estamos indexando uma coluna e tendo como resultado um vetor

masculino <- alunos$sexo == "M"

masculino

is.vector(masculino)

# Assim, se quisermos indexar o vetor "masculino" dentro do dataframe alunos...

alunos$sexo[masculino]

# Acabamos de ver que podemos usar uma operação de lógica em um vetor para filtrar outro vetor. Como podemos aplicar isto a um dataframe então?
  
# Lembre-se que um dataframe “conhece” os vetores que o compõe! Se quiséssemos indexar apenas as linhas que correspondem ao sexo masculino

alunos[alunos$sexo == "M",]

# Podemos ainda determinar quais colunas também queremos reter

alunos[alunos$sexo == "M", c(1:5)]

# Podemos extender o uso da indexação para mais de uma condição.

# Reter todas as observações que correspondam aos alunos do semestre 3 OU 4

alunos[alunos$semestre == 3 | alunos$semestre == 4, ]

alunos[alunos$semestre == 3:4, ]


# Reter todas as observações que correspondam aos alunos acima do semestre 3 OU cujos alunos tenham mais que 25 anos de idade

alunos[alunos$semestre > 3 | alunos$idade > 25, ]

# Reter todas as observações que correspondam aos alunos acima do semestre 3 E cujos alunos tenham mais que 25 anos de idade

alunos[alunos$semestre > 3 & alunos$idade > 25, ]

# Reter todas as observações que correspondam aos alunos acima do semestre 3 E abaixo do semestre 8

alunos[alunos$semestre > 3 & alunos$semestre < 8, ]

# Reter todas as observações que correspondam aos alunos acima do semestre 3 E cujos alunos tenham mais que 25 anos de idade E que sejam homens.

alunos[alunos$semestre > 3 & alunos$idade > 25 & alunos$sexo == "M", ]

# Exercício
#

### Exercícios
# 5. Indexe, ou selecione, todas as linhas de "alunos" cujo valor da coluna peso seja maior do que 65 (inclusive);

# 6. Selecione todas as linhas de "alunos" que correspondam às mulheres da turma, mas removendo as colunas "semestre", "pe", "mao" e "iniciante".

# 7. Retenha uma linha única que corresponde aos seus dados, contendo as informações sobre nome, idade, sexo e altura, mediante as seguintes regras:
  
#  - Não use a coluna nome (ex. alunos$nome == "Daniel Maurenza de Oliveira").
#  - Utilize pelo menos 3 comandos distintos para selecionar a linha.
#  - O penúltimo comando deve selecionar mais do que uma linha.

condicao_peso <- alunos$peso >= 65
alunos[condicao_peso, ]

alunos[alunos$peso >= 65,]

# 2.
colnames(alunos)
alunos[alunos$sexo == "M", -c(7:10)]
alunos[alunos$sexo == "M", c(1:6)]
alunos[alunos$sexo == "M", c("nome", "idade", "sexo", "altura", "peso", "transporte")]


#3.

# daniel <- c("Daniel Maurenza de Oliveira", 39, "M", 1.7, 72, "Publico", 8, 40, 22, TRUE)
#  
# alunos <- rbind(alunos, daniel)


alunos$sexo == "M"
alunos$iniciante == T
alunos$idade > 35

alunos[alunos$sexo == "M" & alunos$iniciante == T & alunos$idade > 35 , 1:4]

## Operação condicionante "ifelse"  ----

# Por fim, vamos aprender a operação condicionante "ifelse". ifelse usa um teste lógico para executar uma ação, que tem a seguinte lógica:
  
# - Dado um teste lógico;
# 
# - Faça isto caso ele seja verdadeiro, ou;
# 
# - Faça isto caso ele seja falso.

args(ifelse)

# Primeiramente, vamos ver como ifelse funciona com "vetores". A leitura do código fica mais fácil se inserirmos cada argumento em uma nova linha)

vetor1 <- 20:30

ifelse(test = vetor1 <= 23,
       yes = "baixo",
       no = "alto")

# Veja como podemos usar esta função na nossa tabela Alunos

mao <- alunos$mao

ifelse(test = mao >= 21,
       yes = "maozão",
       no = "maozinha")

# Você pode encadear diversos testes e substituições lógicas, mas cuidado - isto tende a se tornar cada vez mais complexo!

ifelse(test = mao >= 23,
       yes = "maozão", 
       no = ifelse(test = mao < 23 & mao >= 21,
                   yes = "regular", 
                   no = "maozinha"))
# Agora, vamos ver como ifelse funciona com "dataframes." A sequência lógica é a mesma, porém temos que indexar um dataframe.

classe_mao <- ifelse(test = alunos$mao >= 21,
                     yes = "maozão",
                     no = "maozinha")

# No dataframe, podemos criar uma nova coluna, ou substituir a coluna existente:

alunos$mao_classe <- ifelse(test = alunos$mao >= 21, 
                            yes = "maozão",
                            no = "maozinha")
alunos


alunos$mao <- ifelse(test = mao >= 23,
                     yes = "maozão", 
                     no = ifelse(test = mao < 23 & mao >= 21,
                                 yes = "regular",
                                 no = "maozinha"))
alunos
## Exercícios
  
# 8. Usando a função “ifelse”, crie uma nova coluna representando a classe de altura. Classifique alunos menores que 1.6m como "baixo", alunos iguais ou maiores que 1,6m e menores que 1,9m como "médio", e alunos maiores ou iguais a 1,9m como "alto".


# Para casa

#Vamos usar uma tabela de dados que já existe no seu R: airquality. Primeiramente, explore o seu conteúdo e estrutura utlizando as funções help, str ou glimpse.

# 1. Retenha todas as colunas cujas linhas pertençam ao mês 8;

# 2. Retenha todas as linhas cuja temperatura seja maior que 70 E a concentração de ozônio maior do que 80;

# 3. Retenha todas as observações que tenham a velocidade do vento maior do que 10 E menor do que 15 OU cuja temperatura seja maior ou igual a 86;

# 4. Por fim, retenha todas as linhas cujo ozônio seja maior do 100, a radiação solar seja menor do que 230 e que a temperatura seja maior ou igual a 90.


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
