# Nesta aula vamos aprender a fazer gráficos (plot). Utilizaremos dois métodos diferentes. Primeiro, usando os comando do pacote R Base que já vem instalado no seu R. Segundo, usando o pacote ggplot2. Se quisermos fazer um gráfico exploratório rapidamente, a função plot do R base é suficiente. No entanto, as funções do pacote ggplot2 fornece muito mais ferramentas, dando maior versatilidade e elegância aos gráficos. Usaremos algumas tabelas de dados incluídos no R para facilitar a construção dos gráficos.


## Gráficos de dispersão ----

# Para fazermos um gráfico de dispersão utilizamos duas informações básicas: o eixo x e o eixo y. A tabela "mtcars" já está embutida no R. Ela mostra a relação entre o consumo de combustível (mpg = Miles/(US) gallon) e outros 10 aspectos de automoveis para 32 modelos. Qual a relação entre o peso e o consumo de combustível?
  
# Utilizando o R base

mtcars

plot(mtcars$wt, mtcars$mpg)


# Resposta: quanto maior é o peso do carro (wt), menor é a eficiência de  consumo (mpg).

# Uma forma mais sucinta para a construção de gráficos é o uso da expressão "~" para indicarmos que os valores do eixo y variam "em função" dos valores do eixo x. No entanto, precisamos também indicar a tabela de origem dos dados


plot(mpg ~ wt, data = mtcars)


# - Utilizando o ggplot2 

#install.packages("ggplot2", dependencies = T)
library(ggplot2)

ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point()


# A primeira parte ("ggplot") cria o objeto plot. O argumento "data" nos diz ao objeto plot onde encontrar as variáveis que serão usadas. O argumento "mapping" possui a função aes() = aestetics, que mapeia ao objeto plot quais são as variáveis do eixo-x e eixo-y. A função "aes()" do argumento "mapping" NÃO diz onde estão as variáveis que podem ser usadas. A função aes() também defini elementos visuais, tais como cor, formato, tamanho e outras características, mas isso veremos na proxima aula.

# A segunda parte (geom_point) adiciona a camada que informa o tipo de gráfico que será gerado através de uma função "geom_", no caso, um gráfico de pontos. Note que sem adicionar a segunda parte, não temos um gráfico completo


ggplot(data = mtcars, mapping = aes(x = wt, y = mpg))

ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point()

# Percebam que o comando acima é igual a:
  
p <- ggplot(data = mtcars, mapping = aes(x = wt, y = mpg))
p + geom_point()


# Para iniciantes, é recomendado escrever os argumentos e separá-los em linhas para tornar mais agradável visualmente


p = ggplot(data = mtcars, 
           mapping = aes(x = wt,
                         y = mpg))
p +
  geom_point()


### Gráficos de linha ----

# Para usarmos o R base, incluimos um vetor de valores x e um vetor de valores y na função plot()

plot(x = pressure$temperature, y = pressure$pressure, type = "l") # o argumento type = "l" indica que o gráfico será de linhas.

# Para adicionarmos pontos e linhas, adicionamos as funções "points()" e "lines()". Observe que ao usarmos a função plot e o argumento type = "l" criamos um gráfico de linhas. Porém, ao utilizarmos a função lines() acrescentamos linhas a um gráfico existente


plot(x = pressure$temperature, y = pressure$pressure, type = "l")

points(x = pressure$temperature, y = pressure$pressure)

lines(x = pressure$temperature, y = pressure$pressure/2)

points(x = pressure$temperature, y = pressure$pressure/2)


# - Para usarmos o ggplot2, usamos a função geom_line

p <- ggplot(pressure, aes(x = temperature, y = pressure)) 

p + 
  geom_line()


# Para adicionarmos pontos, adicionamos uma nova camada da função geom_points()

p + 
  geom_line() +
  geom_point()

### Gráficos de barra ----

# - Para usarmos o R base, usamos a função "barplot" incluindo um vetor de valores para a altura das barras, e um vetor de categorias para cada barra.


BOD

barplot(BOD$demand, names.arg = BOD$Time)


# Muitas vezes desejamos um gráfico de barras que mostre a frequência de observações em cada categoria. Para fazermos este gráfico, precisamos calcular a frenquência e fornecer estas informações para o gráfico (o número de observações em cada categoria)

mtcars

mtcars$cyl

tabela <- table(mtcars$cyl)

barplot(tabela)


#- Utilizando o ggplot. Para usarmos o ggplot, também devemos oferecer um vetor de valores para a altura das barras, um vetor de categorias para cada barra e adicionamos a função "geom_col()"

p <- ggplot(data = BOD, mapping = aes(x = Time, y = demand))
p + geom_col()


# Note que o ggplot2 diferencia variáveis contínuas das categóricas. Como utilizamos o vetor Time da classe numérica, o ggplot2 entende ser uma variável continua, que no caso, não tem valores para o Time = 6. Para interpretarmos Time como variável categórica, temos que usar a função factor() para este vetor.

p <- ggplot(data = BOD, 
            mapping = aes(x = factor(Time), 
                          y = demand))
p + geom_col()

# Para mostrarmos a frequência das observações para cada categoria usando ggplot2 (similar a função table em R Base), usamos a função geom_bar, sem informar o eixo y, pois esse automaticamente representará a frequência das observação.


p <- ggplot(mtcars, aes(x = cyl))
p + geom_bar()


# Novamente, veja a diferença entre variável continua e categórica. Ao utilizarmos a função factor(), automaticamente o eixo y representa a frequência (número de linhas) de cada categoria da variável do eixo x.

p <- ggplot(mtcars, aes(x = factor(cyl)))
p + geom_bar()


### Gráficos de histogramas ----

# Diferente dos gráficos que vimos anteriormente, os histogramas são gráficos de 1 dimensão, que mostra a frequência de valores contínuos

# - Usando o R base

mtcars$mpg

hist(mtcars$mpg)


# Podemos especificar o número de barras do histograma com o argumento "breaks". Especificar o número de barra pode facilitar a visualização dos detalhes que queremos mostrar.

hist(mtcars$mpg, breaks = 3)
hist(mtcars$mpg, breaks = 10)

#- Usando o ggplot2 

p <- ggplot(mtcars, aes(x = mpg)) 
p +  geom_histogram()


# Também podemos ajustar o número de barras usando o argumento "bins"

p +  geom_histogram(bins = 7)


### Gráficos boxplot ----

# Boxplot é um tipo de gráfico frequentemente utilizado para visualizar a distribuição das observações. O Boxplot informa o valor máximo, mínimo, o primeiro (25%) e terceiro (75%) quartil, a mediana e se presente, os outliers.


# - Usando o R base

plot(ToothGrowth$supp, ToothGrowth$len)


# - Usando o ggplot2 

p <- ggplot(ToothGrowth, aes(x = supp, y = len))
p +  geom_boxplot()


### Exercícios
  
#   1. Usando o pacote R base ou ggplot (mas tente usar os dois), faça um gráfico para cada tipo de gráfico (dispersão, linha, barra, histograma, e boxplot), usando qualquer variável da nossa planilha “Alunos”. 
# 
# 2. Qual pacote de gráfico você se sentiu mais confortável para usar? Porque?
  




# Vamos melhorar os gráficos, adicionando elementos visuais, tais como cores, tamanho, tipos, etc. Para inicialmente compreendermos o uso dos argumento visuais, vamos nos concentrar nos gráficos de dispersão

install.packages("gcookbook")
library(gcookbook) # Load gcookbook for the heightweight data set
library(dplyr)

heightweight %>%
  select(ageYear, heightIn)


ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point()

# Ao invez de utilizarmos pontos para indicar a dispersão dos valores, podemos alterar o formato visual com o argumento "shape".

p <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) 

p + geom_point(shape = 2)
p + geom_point(shape = 5)

# também podemos alterar o tamanho dos pontos, usando o argumento "size"

p + geom_point(size = 5) 

# Similarmente, podemos alterar a cor com o argumento "color" ou "colour", que pode ser um número, um caractere, ou um dos nomes indicados na figura abaixo. 


p + geom_point(shape = 1, color = 5)
p + geom_point(shape = 1, colour = "red")
p + geom_point(shape = 1, colour = "coral4")


# Podemos também diferenciar a color da linha do ponto e do preenchimento do ponto. No entanto, a alteração do preenchimento só é possivel para os pontos com shape entre 21–25 

p + geom_point(shape = 1, colour = "black", fill = "red")
p + geom_point(shape = 21, colour = "black", fill = "red")


# Por fim, podemos adicionar todos estes elementos simultaneamente

p + geom_point(shape = 5, size = 3, color = 4)


# Aprendemos que para definirmos elementos visuais de um gráfico, adicionamos comandos dentro da função geom_. Porém, nem todos os gráficos suportam os mesmo comandos. Por exemplo, não é possível alterar o formato do ponto em um gráfico de linhas

# Vamos ver alguns elementos visuais em outros tipos de gráficos.

# Em graficos de linha, podemos mudar o tipo de linha (linetype), a largura (size) e a cor (color ou colour)

BOD
p <- ggplot(BOD, aes(x = Time, y = demand))

p + geom_line(linetype = "dashed", size = 1, color = "blue")

p + geom_line(color = "darkgreen", size = 1.5)

# Um argumento bastante interessante é a transparencia (alpha), que pode ser fundamental para uma melhor interpretação e visualização do gráfico. Veja por exemplo a diferença entre estes gráficos de pontos.

diamonds
p <- ggplot(diamonds, aes(x = carat, y = price))

p + geom_point()

p + geom_point(alpha = .1)

p + geom_point(alpha = .01)

# Similarmente podemos usar o argumento alpha para os graficos de linha

p <- ggplot(BOD, aes(x = Time, y = demand))

p + geom_line(color = "darkgreen", size = 1.5)

p + geom_line(color = "darkgreen", size = 1.5, alpha = 0.5)

# Gráficos de barras ----
# Repare que os argumentos relacionados aos elementos visuais de barras são similares aos outros gráficos.

pg_mean

p <- ggplot(pg_mean, aes(x = group, y = weight)) 

p + geom_col(color = "black", fill = "lightblue")


#Notem que As regras para elementos visuais que aprendemos nos gráficos de pontos também se aplicam nos outros tipos de graficos. Porém, alguns elementos diferem dependendo da função geom_() sendo utilizada. No entanto, fica claro que as regras de uso e até mesmo os argumentos são muito similares independente do tipo de gráfico a ser feito.



 # Exercícios 


# 3. Busque no seu script os códigos utilizados nos gráficos criados no exercício anterior. Adicione elementos visuais de cor, tamanho, formato e preenchimento, conforme vimos na aula.


