# Curso R Intermediário - Bud 
# Dia 3; parte 1

# Função loop "For"

# Loop For ----

# As funções loop são usadas para aplicar a mesma tarefa para um dado conjunto de dados de acordo com os níveis de um fator - é como se para cada nível de um fator elas aplicassem uma tarefa, fossem para outro nível, repetissem a mesma tarefa; corresse para o próximo nível, repetisse a mesma tarefa; por aí vai…

# existem diversas funções loop, mas nós vamos focar na função loop FOR, pois ela permite fazer o que a gente quiser, ao invez de algo pré-definido.

# As funções de loop for servem para repetir uma tarefa específica no R tantas vezes quanto desejarmos.

# A função for funciona da seguinte maneira:  for(var in seq) {command}. Para cada valor de i o R executa os comandos que estão entre as chaves.

# Na prática. vamos pedir que o R print (imprimir) o nome de cada aluno da planilha alunos


for (i in 1:10) {
  print(i)
}

# vamos ver o que o for está fazendo em câmera lenta
for (i in 1:10) {
  print(i)
  Sys.sleep(time = 1)
}



# um exemplo com letras

x <- letters[1:4]

for (i in seq_along(along.with = x)) {
  print(x[i])
  Sys.sleep(time = 1)
}


# outro exemplo


alunos <- read_csv("dados/alunos_alterado.csv")
alunos

alunos$nome

for (i in alunos$nome){
  print(i)
}


for (i in alunos$nome){
  print(paste("aluno", i))
}


# ou seja, na linha i, printar o nome i da planilha alunos. Neste caso, o tamanho de i é igual ao tamanho de alunos$nome

# Vamos ver uma outra forma que talvez seja mais facil de entender. No argumento seq, nós vamos utilizar a expressão 1:n. Ou seja, for(i in 1:n) {comandos}. A expressão “i in 1:n” indica que os valores de i serão de i = 1 até i = n.

# Assim, na primeira rodada i = 1, na segunda i = 2, e assim por diante até que i = n.

# Primeiro precisamos criar um objeto vazio para armazenar o resultado da operação. Vamos criar um objeto numérico vazio, chamado "resu" (abreviação de resultado). Depois, vamos executar para cada linha de "resu" uma operação matemática
resu <- numeric(0) 
resu  


for (i in 1:5) { # será o i = 1, i = 2, i = 3, i = 4, i = 5
  resu[i] <- i^2 # realiza a operação e armazena no vetor resu
} # fim da função
resu


# outro exemplo

idade <- alunos$idade

# Vamos pedir para o R multiplicar a idade de cada aluno por 2
idade_x2 <- numeric()


# Agora vamos utilizar a função "for para multiplicar i valores por 2.

for (i in 1:length(idade)) { # será o i = 1, i = 2, i = 3, i = 4, i = 5
  idade_x2[i] <- idade [i] * 2 # realiza a operação e armazena no vetor resu
} # fim da função

idade_x2
idade


# Para não ficar dúvidas, vamos fazer um “filme” para demonstrar o que a função "for" está fazendo.

plot(0:10,0:10, type="n") # plota um gráfico vazio 
for (i in 1:9) {
  text(i,i, paste("Passo", i)) # plota um texto no gráfico
  Sys.sleep(1) ## retarda os passos em 1 s
}

# Exercício

# A sequência de Fibonacci é uma sequência famosa na matemática. Os dois primeiros números da sequência são [1, 1].
# Os números subsequentes são compostos pela soma dos dois números anteriores.
# Assim, o terceiro número da sequência de Fibonacci é 1 + 1 = 2, o quarto é 1 + 2 = 3, e assim por diante.
# Utilize a função loop "for" para descobrir os 12 primeiros números da sequência de Fibonacci


Fibonacci <- c(1, 1) # o primeiro e segundo valor da sequência devem ser 1
Fibonacci


for (i in 3:12) { # 3 a 12 porque já temos os dois primeiros
  Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
}
Fibonacci

# Exercícios
# 1. Mude os dois primeiros elementos da sequencia para 2 e 2
# 2. Mude os dois primeiros elementos da sequencia para 3 e 2
# 3. Modifique o código para que os valores sejam compostos pela diferença entre o primeiro e o segundo valor imediatamente anteriores.
# 4. Modifique o código para que os valores sejam compostos pela diferença entre os dois valores imediatamente anteriores somada ao terceiro valor imediatamente anterior. Faça inicialmente com que a sequencia comece com 3 valores [1,1,1]


# # 1. 
# Fibonacci <- c(2, 2) 
# Fibonacci
# 
# 
# for (i in 3:12) { 
#   Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
# }
# Fibonacci
# 
# 
# # 2. 
# Fibonacci <- c(3, 2) 
# Fibonacci
# 
# 
# for (i in 3:12) { 
#   Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
# }
# Fibonacci
# 
# 
# # 3. 
# Fibonacci <- c(3, 2) # o primeiro e segundo valor da sequência devem ser 1
# Fibonacci
# 
# 
# for (i in 3:12) { # 3 a 12 porque já temos os dois primeiros
#   Fibonacci[i] <- Fibonacci[i - 2] - Fibonacci[i - 1]
# }
# Fibonacci
# 
# 
# 4.
Fibonacci <- c(1,1,1)
Fibonacci


for (i in 4:12) {
  Fibonacci[i] <- (Fibonacci[i - 2] - Fibonacci[i - 1]) +  Fibonacci[i - 3]
}
Fibonacci

# 5. Utilizando as funções "For" e "write_csv", crie um arquivo .csv para cada coluna da planilha Alunos. Dica!!! utilize a função "paste" para nomear os arquivos que serão salvos em cada rodada do loop. 

# alunos
# 
# 
# for (i in 1:length(alunos)) { # 3 a 12 porque já temos os dois primeiros
#   # i = 1
#   coluna.i <- alunos[,i]
#   write_csv(x = coluna.i, file = paste0("dados/", "coluna", i, ".csv"))
# }




# "for" em data.frame

nome_pe_mao <- data.frame(nome = NA, pe = NA, mao = NA)

for(i in 1:nrow(alunos)){
  #i = 1
  nome_pe_mao[i, 1] <- alunos[i, "nome"]
  nome_pe_mao[i, 2] <- alunos[i, "pe"]
  nome_pe_mao[i, 3] <- alunos[i, "mao"]
  
}

nome_pe_mao

# Vamos ver mais um exemplo usando a função "for", mas desta vez usando uma matrix. Não se preocupe, a indexação de matrix é igual à de dataframe.

# Vamos fazer uma amostragem utilizando a função for para realizar sorteios e amostragens aleatóreas, Similar ao jogo da megasena

# Vamos sortear 20 jogos da megasena.

njogos <- 20 # determinar o número de jogos

numeros <- matrix(NA, nrow = 6, ncol = njogos) # criar a matriz para armazenar os jogos

for (i in 1:njogos) { # determina o número total de jogos sorteados

    numeros[, i] <- sample (1:60, 6) # realiza a amostragem de 6 números por jogo
    
}
numeros


# Vamos ver um filme do que aconteceu


numeros <- matrix(NA, nrow = 6, ncol = njogos) # criar a matriz para armazenar os jogos

for (i in 1:njogos) { # determina o número total de jogos sorteados
  
  numeros[, i] <- sample (1:60, 6) # realiza a amostragem de 6 números por jogo
  print(numeros)
  Sys.sleep(0.3)
  
}
numeros
