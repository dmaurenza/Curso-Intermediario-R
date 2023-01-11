


# install.packages("ggplot2", dependencies = T)
# install.packages("gapminder", dependencies = T)
library(ggplot2)
library(gapminder)  


# Nesta aula vamos adicionar complexidades aos nossos gráficos, pois nem sempre o que aprendemos até agora é suficiente para ilustrarmos os nossos dados como desejamos. Veremos como configurar outros elementos de um grafico, tais como os eixos e a legenda.

# Digamos que queremos fazer um gráfico de dispersão que demonstre a relação entre a altura e o peso dos alunos da turma (tabela alunos), porém, queremos diferenciar essa relação entre homens e mulheres.Para tanto, precisamos incluir uma nova variável ao nosso gráfico, neste caso, sexo, que informe para cada ponto se a relação altura peso é de homem ou mulher

# Para fazermos este tipo de gráfico, vamos usar a habilidade do ggplot que permite incluir elementos visuais dentro da função aes(). Vamos ver alguns exemplos utilizando os dados gapminder, que mostra valores de renda per capita, expectativa de vida, país, continente e tamanho populacional

p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point() 

p + geom_point(aes(color = continent))

# Lembre-se, a função aes() mapeia as variáveis dos seus dados para as propriedades do grafico. Portanto, as variáveis dos seus dados que irão mapear os elementos visuais devem estar dentro da função aes(). Se utilizarmos fora da função aes() temos um erro.

p + geom_point(color = continent)

# Como vimos, as varias funções geom_() podem usar diversos argumentos que afetaram elementos visuais, porém eles podem ser utilizados dentro ou fora da função aes(), dependendo do que desejamos.Se utilizamos informações que estão dentro da tabela de dados, temos que usar estes argumentos dentro de aes().

p + geom_point(color = "purple")

p + geom_point(color = "purple", size = 5)

p + geom_point(color = "purple", shape = 3)


# Ao adicionarmos uma nova variável na função aes(), podemos manter os outros argumentos fora da função aes()

p + geom_point(aes(color = continent))

p + geom_point(aes(color = continent), shape = 3, size = 2)

# Neste exemplo, "continent" é uma variável categórica. Veja o que acontece se usarmos uma variável numérica


p + geom_point(aes(color = pop), size = 2)

p + geom_point(aes(size = pop))

# Veja um outro exemplo, desta vez em um gráfico de linhas

library(gcookbook) 


p <- ggplot(tg, aes(x = dose, y = length)) 

p + geom_line(aes(colour = supp))

p +  geom_line(aes(linetype = supp))

p +  geom_line(aes(linetype = supp), color = "red")

# Podemos inclusive utilizar a nova variável para diferenciar mais do que um elemente visual:

p +  geom_line(aes(linetype = supp, color = supp, size = supp))


# Notem que a legenda só aparece quando elementos visuais são adicionados a nova variável dentro da função aes(). Mais adiante veremos como fazer ajustes na legenda.

# vamos ver agora um exemplo com gráficos de barra 

library(gcookbook)  # Load gcookbook for the cabbage_exp data set
cabbage_exp

p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))

p + geom_col(aes(fill = Cultivar))

# Podemos definir dois layouts para os gráficos de barra

p + geom_col(aes(fill = Cultivar), position = "dodge")

p + geom_col(aes(fill = Cultivar), position = "stack")

# E definir outros elementos das barras

p + geom_col(aes(fill = Cultivar), position = "dodge", color = "black")


p + geom_col(aes(fill = Cultivar), position = "dodge", color = "black", size = 3)

# Por fim, Podemos melhorar ainda mais a visualização dos gráficos utilizando a função labs(). Esta função permite modificar os eixo, título e subtitulo

p + geom_col(aes(fill = Cultivar), position = "dodge")+
  scale_fill_manual(values=c("darkgreen", "darkblue"))+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",  # não esta configurado para aceitar acentuação
       caption = "Fonte: ...") 


# Alterar a escala
p + geom_col(aes(fill = Cultivar), position = "dodge")+
  scale_fill_manual(values=c("darkgreen", "darkblue"))+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",
       caption = "Fonte: ...")+
  ylim(c(0, 2))

p + geom_col(aes(fill = Cultivar), position = "dodge")+
  scale_fill_manual(values=c("darkgreen", "darkblue"))+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",
       caption = "Fonte: ...")+
  ylim(c(0, 5))


#####
# Exercicios
# 1. Crie um gráfico de pontos utilizando a tabela Alunos, sendo o eixo-x a idade dos alunos e o eixo-y o peso
# 2. Adicione cores distintas em função da variável sexo
# 3. Ajuste o tamanho dos pontos de acordo com a altura dos alunos
# 4. Melhor o gráfico. Nomeie o eixo x como "Idade (anos), o eixo-y como "Peso (kg)", e o título do gráfico como "Perfil da turma"
# 5. Ajuste os limites dos eixos x e y.

library(tidyverse)

alunos <- read_csv("dados/alunos_alterado.csv")

fig_1 <- ggplot(data = alunos, mapping = aes(x = idade, y = peso))
fig_1 + geom_point()

fig_1 + geom_point(aes(color = sexo))
fig_1 + geom_point(aes(color = sexo, size = altura))
fig_1 + 
  geom_point(aes(color = sexo, size = altura))+
  labs(x = "Idade (anos)",
       y = "Peso (kg)",
       title = "Perfil da turma")

# Vamos adicionar um pouco mais de complexidades ao nosso gráfico, a fim de torna-lo mais elegante. Digamos que as cores usadas automáticamente pelo ggplot não são muito agradáveis. Vamos ver como podemos alterar manualmente as cores das barras usando uma função chamada "scale_fill_manual()

p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))

p + geom_col(aes(fill = Cultivar)) +
  scale_fill_manual(values=c("darkgreen", "darkblue"))

# Similarmente, podemos alterar as cores de linhas e pontos usando a função "scale_color_manual. 
p <- ggplot(tg, aes(x = dose, y = length)) 

p + geom_line(aes(colour = supp), size = 4)+
  scale_color_manual(values=c("darkgreen", "darkblue"))

p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(aes(color = continent))+
  scale_color_manual(values=c("darkgreen", "darkblue", "yellow", "black", "red"))

# Importante! As funções scale_fill_manual e scale_color_manual só funcionam corretamente se dentro da função geom_() foram utilizados os argumentos "fill" e "color", respectivamente, dentro da função aes(). Pense na racionalidade por traz disso. Ao utilizarmos a função scale..., estamos modificando parâmetros de algo já existente. Se não incluímos antes, não há elementos para serem modificados

p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))
p + geom_col(aes(color = Cultivar)) 

p + geom_col(aes(color = Cultivar)) +
  scale_fill_manual(values=c("darkgreen", "darkblue"))

p + geom_col(aes(fill = Cultivar)) 

p + geom_col(aes(fill = Cultivar)) +
  scale_fill_manual(values=c("darkgreen", "darkblue"))

p + geom_col(aes(color = Cultivar)) 

p + geom_col(aes(color = Cultivar)) +
  scale_color_manual(values=c("darkgreen", "darkblue"))

# Também podemos adicionar textos. Em gráficos de barra, adicionar textos fornece maior detalhamento dos valores da barra.Existem diversos ajustes que podem ser feitos, e dependendo do ajuste, temos que adicionar o argumento group dentro da função aes()

p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))

p + geom_col(aes(fill = Cultivar), position = "dodge")+
  scale_fill_manual(values=c("darkgreen", "darkblue"))+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "white", 
            size = 3,
            vjust = 1.5,
            position = position_dodge(0.9))


p + geom_col(aes(fill = Cultivar), position = "dodge")+
  scale_fill_manual(values=c("darkgreen", "darkblue"))+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))






