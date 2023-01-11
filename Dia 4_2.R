Funções theme()

#A função theme() tem por objetivo ajustar/customizar elementos do gráficos não relacionados aos dados. Podemos ajustar o painel onde o gráfico esta inserido, o fundo do gráfico, a legenda e os eixos titulos, etc. 

#Dentro da função theme(), utilizamos o argumento específico que desejamos alterar, juntamente com a função element() correspondente ao ajuste desejado. As funções elements se dividem em:

#1. element_text() - Modifica rótulos e cabeçarios. Podemos controlar a fonte, cor, tamanho, ajustes horizontais e verticas, 

p <- p + geom_col(aes(fill = Cultivar), position = "dodge")+
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

p + theme(plot.title = element_text(size = 6))
p + theme(plot.title = element_text(face = "bold", colour = "red"))
p + theme(plot.title = element_text(hjust = 1))


#2. element_line() - Modifica parâmetros das linhas, tais como cor, tamanho e estilo

p + theme(panel.grid.major = element_line(colour = "black"))
p + theme(panel.grid.major = element_line(size = 2))
p + theme(panel.grid.major = element_line(linetype = "dotted"))
p + theme(panel.grid.major = element_line(linetype = "dotted"))

# 3. element_rect() - Modifica ajustes de retangulos, muito utilizado para modificar o fundo dos gráficos, e outros parâmetros de área. 

p + theme(plot.background = element_rect(fill = "grey80", colour = NA))
p + theme(plot.background = element_rect(colour = "red", size = 2))
p + theme(panel.background = element_rect(fill = "linen"))

# 4. element_blank() - Modifica para "Nada". Usado quando não queremos fazer ajustes ou não queremos alocar espaços.

p + theme(panel.background = element_blank())
p + theme(axis.title.x = element_blank())
p + theme(axis.title.y = element_blank())
p + theme(axis.line = element_line(colour = "grey50"))
p + theme(axis.line = element_blank())
p + theme(axis.text = element_text(size = 25))
p + theme(axis.title = element_text(size = 25))


# Como vimos anteriormente, podemos incluir funções no mesmo gráfico


p + theme(plot.title = element_text(hjust = 0.5, colour = "grey25"),
          panel.grid.major.y = element_line(colour = "grey"),
          panel.grid.minor = element_blank(),
          panel.background = element_blank(),
          axis.line = element_line(colour = "black"),
          legend.position = "right")

# Veja em help a diversidade de funcionalidades que a função theme fornece, e  [*aqui*](https://ggplot2-book.org/polishing.html#theme-elements) uma lista de argumentos que podem ser usados na função theme(), juntamente com a função element() correspondente




# Por fim, vamos ver como plotamos de uma vez só multiplos graficos. O ggplot possui a função faced_wrap, que elegantemente desenha uma seguência de gráficos em dimensão 2d

p + theme(plot.title = element_text(hjust = 0.5, colour = "grey25"),
          panel.grid.major.y = element_line(colour = "grey"),
          panel.grid.minor = element_blank(),
          panel.background = element_blank(),
          axis.line = element_line(colour = "black"),
          legend.position = "right")+
  facet_wrap(vars(Date))


# Um aspecto do ggplot que causa muita confusão entre os usuários é qua podemos chegar ao mesmo resultado de diferentes forma. Se observarmos bem, tanto a primeira como a segunda parte do código apresentam o argumento mapping, que inclui a função aes(). Veja os exemplos abaixo

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point(aes(color = continent))


ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point()

# Então qual é a diferença entre inserir elementos visuais na primeira ou na segunda parte? Quando inserimos na primeira parte, os elementos visuais se aplicaram para todo o gráfico, enquanto que ao inserir na segunda parte, os elementos visuais se aplicarão somente para aquela  função geom_()

# Por exemplo, ao usarmos mais do que uma função geom_() em um gráfico, podemos definir elementos visuais distintos para cada função geom(?

ggplot(tg, aes(x = dose, y = length)) + 
  geom_line() +
  geom_point(size = 4)  # Make the points a little larger

ggplot(tg, aes(x = dose, y = length)) + 
  geom_line() +
  geom_point(size = 4, shape = 21)  


# Agora veja o que acontece se adicionarmos uma nova variável na primeira parte do gráfico

ggplot(tg, aes(x = dose, y = length, shape = supp)) + 
  geom_line() +
  geom_point(size = 4) 

#Ou seja: a alteração do formato foi feita em todo o gráfico de acordo com a nova variável "supp", enquanto que a alteração do tamanho foi feita somente aos pontos da função geom_(). 

ggplot(tg, aes(x = dose, y = length, fill = supp)) + 
  geom_line(color = "darkgreen") +
  geom_point(size = 4, shape = 21) 

# Neste exemplo, alteramos o preenchimento para todo o gráfico, a cor da linha e o tamanho e formato dos pontos.
















p + geom_smooth()

# Um outro formado tipo de plot é o "geom_smooth()" que calcula uma linha suave sombreada que representa o erro padrão da linha

# Se quisermos adicionar os pontos, nós simplismente adicionamos uma nova camada geom_point():

p + geom_smooth() + geom_point() 

