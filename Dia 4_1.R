# Nesta aula vamos adicionar complexidades aos nossos gráficos, pois nem sempre o que aprendemos até agora é suficiente para ilustrarmos os nossos dados como desejamos. Veremos como configurar outros elementos de um gráfico, tais como os eixos e a legenda.

## Função aes() ----

# Digamos que queremos fazer um gráfico de dispersão que demonstre a relação entre a altura e o peso dos alunos da turma (tabela alunos). Porém, queremos diferenciar essa relação entre homens e mulheres. Para tanto, precisamos incluir uma nova variável ao nosso gráfico, neste caso, "sexo", que informe para cada ponto se a relação entre altura e peso é de um homem ou uma mulher.

# Para fazermos este tipo de gráfico, vamos usar a habilidade do ggplot2 que permite incluir elementos visuais dentro da função aes(). Vamos ver alguns exemplos utilizando os dados gapminder, que mostra valores de renda per capita, expectativa de vida e tamanho populacional para diversos países e continentes.

library(ggplot2)
library(gapminder)  

p <- ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))
p + geom_point() 

# Interpretação: a expectativa de vida aumenta abruptamente com o aumento da renda per capita, até um teto de idade (entre 70 e 80 anos)

# Incluindo uma nova variável à função aes() dentro da função geom_(), podemos diferenciar a relação entre espectativa de vida e renda per capita para cada continente. A função aes() esta dentro do argumento "mapping", portanto ela mapeia as variáveis dos seus dados (argumento "data") para as propriedades do gráfico. 


p + geom_point(aes(color = continent))

# porém, há diferenças entre os continentes

# Notem que os elementos visuais provenientes da tabela de dados devem estar dentro da função aes(). Se utilizarmos fora da função aes() temos um erro.


p + geom_point(color = continent)


# Como vimos, as funções geom_() podem usar diversos argumentos que modificam elementos visuais, porém eles podem ser utilizados tanto dentro como fora da função aes(), dependendo do que desejamos. Se utilizamos informações que estão dentro da tabela de dados, temos que usar estes argumentos dentro de aes()


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


# Podemos inclusive utilizar a nova variável para diferenciar mais do que um elemento visual:
  
p +  geom_line(aes(linetype = supp, color = supp, linewidth = supp))


# Notem que a legenda só aparece quando elementos visuais são adicionados a nova variável dentro da função aes(). Mais adiante veremos como fazer ajustes na legenda.


# Vamos ver um exemplo com gráficos de barra. Neste caso, para preenchermos as barras com cores diferentes, utilizamos o argumento "fill"

library(gcookbook)  
cabbage_exp

p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))

p + geom_col(aes(fill = Cultivar))


#Podemos definir dois layouts para os gráficos de barra


p + geom_col(aes(fill = Cultivar), position = "dodge")

p + geom_col(aes(fill = Cultivar), position = "stack")


# Podemos também definir outros elementos das barras


p + geom_col(aes(fill = Cultivar), position = "dodge", color = "black")

p + geom_col(aes(fill = Cultivar), position = "dodge", color = "black", linewidth = 3)

# Reparem que nos gráficos de barras, "color" representa a cor da linha. Para modificar a cor de preenchimento, usamos o argumento "fill"


## Funções de texto e rótulos ----

# Podemos melhorar ainda mais a visualização dos gráficos utilizando a função labs(). Esta função permite modificar os eixo, título, subtitulo e a fonte dos dados


p + geom_col(aes(fill = Cultivar), position = "dodge")+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",  # não esta configurado para aceitar acentuação
       subtitle = "subtitulo",
       caption = "Fonte: R base") 

# Podemos adicionar textos para fornecer maior detalhamento dos valores da barra. Existem diversos ajustes que podem ser feitos, e dependendo do ajuste, temos que adicionar o argumento group dentro da função aes()


p + geom_col(aes(fill = Cultivar), position = "dodge")+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",  # não esta configurado para aceitar acentuação
       subtitle = "subtitulo",
       caption = "Fonte: R base")+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))

# Por fim, vamos alterar as escalas dos eixos. Neste exemplo, como utilizamos um gráfico de barras onde o eixo x é categórico, só podemos alterar a escala do eixo y


p + geom_col(aes(fill = Cultivar), position = "dodge")+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",  # não esta configurado para aceitar acentuação
       subtitle = "subtitulo",
       caption = "Fonte: R base")+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))+
  ylim(c(0, 2))

p + geom_col(aes(fill = Cultivar), position = "dodge")+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",  # não esta configurado para aceitar acentuação
       subtitle = "subtitulo",
       caption = "Fonte: R base")+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))+
  ylim(c(0, 5))

# Exercicios
  
#   1. Crie um gráfico de pontos utilizando a tabela Alunos, sendo o eixo-x a idade dos alunos e o eixo-y o peso
# 
# 2. Adicione cores distintas em função da variável sexo
# 
# 3. Ajuste o tamanho dos pontos de acordo com a altura dos alunos
# 
# 4. Melhor o gráfico. Nomeie o eixo x como "Idade (anos)", o eixo-y como "Peso (kg)", e o título do gráfico como "Perfil da turma"
# 
# 5. Ajuste os limites dos eixos x e y.
#####
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



# Funções scale ----

# Vamos adicionar um pouco mais de complexidades ao nosso gráfico, a fim de torná-lo mais elegante. Digamos que as cores usadas automaticamente pelo ggplot não são muito agradáveis. Vamos ver como podemos alterar manualmente as cores das barras usando uma função chamada "scale_fill_manual()"


p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))

p + geom_col(aes(fill = Cultivar)) +
  scale_fill_manual(values=c("darkgreen", "darkblue"))


# Similarmente, em gráficos de linhas e pontos podemos alterar as cores das linhas e dos pontos usando a função "scale_color_manual". 

p <- ggplot(tg, aes(x = dose, y = length)) 

p + geom_line(aes(colour = supp), size = 4)+ # gráfico de linhas
  scale_color_manual(values=c("darkgreen", "darkblue"))


p <- ggplot(data = gapminder,aes(x = gdpPercap, y = lifeExp))

p + geom_point(aes(color = continent))+ # gráfico de pontos
  scale_color_manual(values=c("darkgreen", "darkblue", "yellow", "black", "red"))


#Importante! As funções "scale_fill_manual" e "scale_color_manual" só funcionam corretamente se,  dentro da função geom_(), forem inseridos os argumentos "fill" e "color", respectivamente, dentro da função aes(). Pense na racionalidade por tras disso. Ao utilizarmos a função scale..., estamos modificando parâmetros de algo já existente. Ou seja, Se não incluímos a respectiva função antes, não há elementos para serem modificados manualmente



p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))

p + geom_col(aes(fill = Cultivar)) 

p + geom_col() +
  scale_fill_manual(values=c("darkgreen", "darkblue"))

p + geom_col(aes(fill = Cultivar))+
  scale_fill_manual(values=c("darkgreen", "darkblue"))


# Um exemplo com graficos de pontos. Neste caso, devemos usar a função "scale_color_manual"

p <- ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))

p + geom_point(aes(color = continent))

p + geom_point(aes(color = continent))+
  scale_color_manual(values=c("darkgreen", "darkblue", "red", "orange", "purple"))
  
# Agora que aprendemos mais funcionalidades do ggplot2, vamos ver o nosso gráfico final


p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))
p + geom_col(aes(fill = Cultivar), position = "dodge", color = "black")+
  labs(x = "Dias de cultivo",
       y = "Peso (kg)",
       title = "Relacao peso / dias de cultivo",  # não esta configurado para aceitar acentuação
       subtitle = "subtitulo",
       caption = "Fonte: R base")+
  geom_text(aes(label = Weight, group = Cultivar),
            color = "black", 
            size = 3,
            vjust = -0.3,
            position = position_dodge(0.9))+
  ylim(c(0, 4))+
  scale_fill_manual(values=c("darkgreen", "darkblue"))


Exercício
fig_1 <- ggplot(data = alunos, mapping = aes(x = idade, y = peso))
fig_1 +
  geom_point(aes(color = sexo, size = altura))+
  labs(x = "Idade (anos)",
       y = "Peso (kg)",
       title = "Perfil da turma")+
  ylim(c(40, 100))+
  xlim(c(15, 45))+
  scale_color_manual(values=c("darkgreen", "darkblue"))





