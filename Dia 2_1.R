### Leitura e Armazenamento dos dados
# Nesta aula vamos aprender como importar dados externos, fazer algumas manipulações e exportar (armazenar) os resultados. Também vamos ver algumas funções úteis para serem utilizadas durante as análises


# Leitura dos dados ----

#Nosso principal uso da linguagem de programação R é a manipulação e análise de dados. Para tanto, utilizamos dados. Existem duas formas armazenar os dados. A primeira é gerarmos os dados dentro do R, conforme fizemos nas aulas anteriores. A segunda forma, e mais comumente utilizada, é importarmos dados externos
      
#De modo geral, os dados são armazenados em 3 formas diferentes:
        
# - arquivos de Excel com extensão: .xlsx e .xls;
# - arquivos separados por vírgulas: .csv;
# - arquivos de texto separado por tabulação: .txt (menos utilizado);

# Vamos iniciar com o arquivo csv. É possivel utilizar a função "read" de diversos pacotes
      
      
# Usando pacote "utils"
alunos_csv <- read.csv(file = "dados/alunos.csv")

alunos_csv

alunos_csv <- read.csv(file = "dados/alunos.csv", header = F)

alunos_csv

alunos_csv <- read.csv(file = "dados/alunos.csv", header = T)

alunos_csv

# Dependendo da configuração do seu computador, você deve usar a função alternativa

alunos_csv2 <- read.csv2(file = "dados/alunos.csv")

alunos_csv2

alunos_csv2 <- read.csv2(file = "dados/alunos.csv", header = TRUE, sep = ",")

alunos_csv2

# Arquivos .csv também podem ser importados através do pacote "tidyverse". 


#install.packages("tidyverse", dependencies = T)
library(tidyverse) 

alunos_csv <- read_csv(file = "dados/alunos.csv", col_names = F)

alunos_csv

alunos_csv <- read_csv(file = "dados/alunos.csv", col_names = T)

alunos_csv

alunos_csv <- read_csv(file = "dados/alunos.csv", col_names = T)

alunos_csv

# Dependendo da configuração do seu computador, você deve usar a função alternativa

alunos_csv2 <- read_csv2(file = "dados/alunos.csv", col_names = T)

alunos_csv2

alunos_csv2 <- read_csv2(file = "dados/alunos.csv", col_names = F)

alunos_csv2

# Importando arquivos do Excel

# Utilizamos a função "read_xlsx()" para importar arquivos de formato .xlsx. A função não faz parte do pacote base do R, mas sim do pacote "readxl". Portanto, precisamos instalar este pacote.

#install.packages("readxl", dependencies = T)

library(readxl)

alunos_xls <- read_xlsx(path = "dados/alunos.xlsx")

alunos_xls

#Esta função nos permite selecionar qual planilha do arquivo excel desejamos importar

alunos_xls <- read_xlsx(path = "dados/alunos.xlsx", sheet = 2)

alunos_xls

alunos_xls <- read_xlsx(path = "dados/alunos.xlsx", sheet = 1)

alunos_xls

alunos_xls <- read_xlsx(path = "dados/alunos.xlsx", sheet = "metadados")

alunos_xls

## Funções úteis ----

# Vamos ver algumas funções úteis na programação em R. Tais funções ajudam-nos à explorar os dados que temos, bem como utilizarmos auxiliarmente à outras funções. 

# Antes, vamos remover os objetos redundantes, com a função "rm()"

alunos <- alunos_csv

alunos

rm("alunos_csv", "alunos_csv2", "alunos_xls")

# Para visualizarmos a estrutura dos dados, podemos usar as funções "str()" ou "glimpse()"

str(alunos)

# library(tidyverse)

glimpse(alunos)

# Funções "head()" e "tail()". Como a própria palavra em inglês já diz, estas funções mostram os primeiros e últimos dados, respectivamente


head(x = alunos)

head(x = alunos, n = 3)

tail(x = alunos, n = 3)

# Funções "length()", "ncol()" e "nrow()". A função length() em um dataframe automaticamente quantifica o comprimento de colunas. Isto é similar a função ncol()

length(x = alunos) 

ncol(alunos)

# Se quisermos saber o comprimento de linhas, precisamos indexar uma coluna qualquer, Ou utilizarmos a função "nrow"

length(x = alunos[,1])

length(x = alunos$nome)

nrow(alunos)

# Funções de estatistica descritiva. O R possui funções matemáticas descritivas, mas também podemos obter diversas estimativa em um comando único chamado "summary()"

summary(object = alunos)

mean(alunos$idade)

min(alunos$idade)

max(alunos$idade)

median(alunos$idade)

sd(alunos$idade)

range(alunos$idade)


##### Exercícios

# Intervalo de confiança é uma estatística que calcula um intervalo de valores confiante da população dos valores. Para tanto, precisamos realizar uma sequencia de calculos e definir qual a confiança que desejamos. Por exemplo, se definirmos uma confiança de 95%, o intervalo de confiança calculará o valor maximo e minimo (intervalo) em que se encontram 95% dos valores da população de valores.
# 
#   1. Calcule o Intervalo de Confiança de “idade” da planilha “Alunos”, da seguinte forma:
#   - Calcule a média da população de valores;
# - Calcule o tamanho da população de valores (quantos valores existem)
# - Calcule o desvio padrão da população de valores
# - Calcule o erro padrão, dividindo o desvio padrão pela raiz quadrada do tamanho da população;
# - Defina o intervalo de confiança e nomeie como “alpha”. Ex. Alpha de 90% = 0.10; alpha de 95% = 0.05, etc;
# - Calcule o grau de liberdade. Grau de liberdade é o tamanho da população -1. Nomeie como “degrees_of_freedom”;
# - Calcule o t-score relacionado ao CI. Veja “Dicas” para calcular t-score;
# - Calcule a margem de erro, multiplicando t-score por erro padrão;
# - Calcule a margem superior e inferior do intervalo de confiança. Margem superior = media + margem de erro; Margem inferior = média – margem de erro
# 
# Dicas!
#   - Realize as etapas na sequencia apresentada. Nomeie cada objeto, pois eles serão utilizados nas etapas seguintes.
# 
# - Você irá usar uma série de função que aprendemos. São elas: mean, sd, sqrt, length.
# 
# - Você também irá usar operações matemáticas: São elas, soma (+); subtração (-), multiplicação, (*) e divisão (/)
# 
# - T-score = qt(p=alpha/2, df=degrees_of_freedom,lower.tail=F)
# 

# 1. Calcule a média da população de valores;
media <- mean(alunos$idade)

# 2. Calcule o tamanho da população de valores (quantos valores existem);
n <- length(alunos$idade)

# 3. Calcule o desvio padrão da população de valores;
desvio <- sd(alunos$idade)

# 4. Calcule o erro padrão, dividindo o desvio padrão pela raiz quadrada do tamanho da população;
erro <- desvio/sqrt(n)

# 5. Defina a confiança desejada. 90% = 0.10; 95% = 0.05, etc.
alpha <- 0.05

# 6. Calcule o grau de liberdade. Grau de liberdade é o tamanho da população -1
degrees_of_freedom <- n-1

# 7. Calcule o t-score relacionado ao CI. Veja dica de como calcular t-score.
t_score = qt(p=alpha/2, df=degrees_of_freedom,lower.tail=F)

# 8. Calcule a margem de erro, multiplicando t-score por erro padrão
margem_erro <- t_score * erro

# 9. Calcule a margem superior e inferior do intervalo de confiança. Margem superior = media + margem de erro; Margem inferior = média – margem de erro
superior <- media + margem_erro
inferior <- media - margem_erro

CI <- c(superior, inferior)


### Outras funções úteis
# Função "sub()". A função "sub()" permite substituir o valor de um vetor, ou de um vetor dentro de um dataframe, ou lista

# Vetores

letras <- letters[1:10]

sub(pattern = "b", replacement = "z", x = letras)

sexo <- alunos$sexo

sexo

sexo <- sub(pattern = "Masculino", replacement = "M", x = sexo)

sexo

sexo <- sub(pattern = "Feminino", replacement = "F", x = sexo)

sexo

letras_2 <- c(letras, letras)

sub(pattern = "c", replacement = "z", x = letras_2)

letras_2

# ??? Porque a função não funcionou? Lembre-se que você precisa nomear o objeto sendo criado  com a substituição

letras_2 <- sub(pattern = "c", replacement = "z", x = letras_2)

letras_2

# Dataframe

alunos

sub(pattern = "Masculino", replacement = "M", alunos$sexo)

alunos


#Similarmente aos vetores, é necessário nomear o objeto sendo criado com a substituição

# 
alunos$sexo <- sub(pattern = "Masculino", replacement = "M", alunos$sexo)

alunos

alunos$sexo <- sub(pattern = "Feminino", replacement = "F", alunos$sexo)

alunos


# Função "round()". Usamos a função "round" para arredondar valores numéricos. Para exemplificar, vamos criar um vetor com 100 valores com uma distribuição  normal, sendo a média = 3000 e o desvio padrão = 2000

vetor <- rnorm(n = 100,mean = 3000, sd = 2000)

vetor

round(x = vetor)

round(x = vetor, digits = 2)

round(x = vetor, digits = 1)

# O argumento "digits" aceita números negativos

round(x = vetor, digits = -1) # arredonda para dezenas

round(x = vetor, digits = -2) # arredonda para centenas

round(x = vetor, digits = -3) # arredonda para milhares

# Função "rep()". A função "rep" nos permite repetir uma sequência de valores

# repetir a sequência 1, 2, 3, 4 e 5, por 10  vezes
rep(x = c(1, 2, 3, 4, 5), times = 10)

# repetir 10 vezes em sequência cada elemento do vetor 1, 2, 3, 4 e 5 
rep(x = c(1, 2, 3, 4, 5), each = 10)

# combinando times + each [each tem precedencia]
rep(x = c(1, 2, 3, 4, 5), times = 10, each = 10)

# Função "sample()". "Sample" significa "amostra" em inglês. Assim, podemos depreender que a função faz uma amostragem de um vetor

sample(x = vetor, size = 3)

sample(x = vetor, size = 3, replace = T) # Extrai a amostra e mantem os elementos iniciais 

sample(x = vetor, size = 3, replace = T) # Extrai a amostra e remove o elemento

# Alunos, vocês tem alguma dúvida?

sample(x = alunos$nome, size = 3, replace = F) 

# Função unique(). "Unique" seleciona os elementos únicos de um vetor

letras_3 <- rep(letters, each = 3)

letras_3

unique(letras_3)

# Nesta turma de alunos, existem alunos de quais semestres?

unique(alunos$semestre)

#Função paste(). "Paste", em inglês, significa colar. Portanto, depreende-se que a função permite colar diversos objetos em apenas 1 objeto. Esta função é muito utilizada para concatenar caracteres. 

nome_1 <- "Paulo"

nome_2 <- "Maria"

nome_3 <- "João"

paste(nome_1, nome_2, nome_3)

# Repare que os nomes são separados por espaços. Porém, podemos definir caracteres para separar os elementos

paste(nome_1, nome_2, nome_3)

paste(nome_1, nome_2, nome_3, sep = ",")

paste(nome_1, nome_2, nome_3, sep = ";")

paste(nome_1, nome_2, nome_3, sep = ", ")

paste(nome_1, nome_2, nome_3, sep = "/")

#Mas também podemos eliminar os espaços que separam os elementos, com a função "paste0"

paste0(nome_1, nome_2, nome_3)

#Podemos até mesmo criar uma frase

paste0("Os nomes selecionados são ", nome_1, ", ", nome_2, " e ", nome_3)

## Exportando dados ----

# Por fim, vamos aprender a salva/armazenar/exportar os objetos criados. Comumente, os objetos são salvos em arquivo csv. Para isso, existe a função "Write" em diferentes pacotes.

# Usando pacote "utils"


write.csv(x = alunos, file = "dados/alunos_alterado.csv")

# Usando o pacote "readr"

write_csv(x = alunos, file = "dados/alunos_alterado.csv")

# Salvando o objeto em arquivo .xlsx usando o pacote "readr"


write_excel_csv(x = alunos, file = "dados/alunos_alterado.xlsx")

##### Exercícios
  
# 2. Selecione os 3 primeiros e 3 últimos nomes dos alunos da turma
# 
# 3. Substitua o último nome pelo seu nome. Se o seu nome for o último, substitua o primeiro
# 
# 4. Crie um objeto chamado "nomes", usando a função paste ou paste0, com os 3 primeiros selecionados no exercício 2. Este objeto deve ser um vetor com 1 valor.
# 
# 5. Crie um vetor sorteando 2 nomes do dataframe Alunos".

alunos_head <- head(alunos$nome, 3)

alunos_tail <- tail(alunos$nome, 3)

alunos$nome <- sub(pattern = "Daniel Maurenza de Oliveira", "Joana", alunos$nome)

nomes <- paste("Joana", "Maria", "Joao")

sorteio <- sample(alunos$nome, 2)
