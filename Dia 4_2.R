## Funções theme {#anchor1}

# Dentro da função theme(), utilizamos o argumento específico que desejamos alterar, juntamente com a função element() correspondente ao ajuste desejado. Para ilustrarmos mais didaticamente a relação entre a função theme() e a função element(), vamos nomear como "p" todo o gráfico da aula passada

library(ggplot2)
library(gcookbook)

p <- ggplot(data = cabbage_exp, aes(x = Date, y = Weight))+
  geom_col(aes(fill = Cultivar), position = "dodge", color = "black")+
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
p


# Existem 4 elementos theme fundamentais. 

# 1. element_text() - Modifica rótulos e cabeçarios. Podemos controlar a fonte, cor, tamanho, ajustes horizontais e verticas

p + theme(plot.title = element_text(size = 6))

p + theme(plot.title = element_text(face = "bold", colour = "red"))

p + theme(plot.title = element_text(hjust = 1))

p + theme(axis.text = element_text(size = 25))

p + theme(axis.title = element_text(size = 25))


# 2. element_line() - Modifica parâmetros das linhas, tais como cor, tamanho e estilo

p + theme(panel.grid.major = element_line(colour = "black"))

p + theme(panel.grid.major = element_line(linewidth = 2))

p + theme(panel.grid.major = element_line(linetype = "dotted"))



# 3. element_rect() - Modifica ajustes de retangulos, muito utilizado para modificar o fundo dos gráficos, e outros parâmetros de área

p + theme(plot.background = element_rect(fill = "grey80", colour = NA))

p + theme(plot.background = element_rect(colour = "red", size = 2))

p + theme(panel.background = element_rect(fill = "linen"))



# 4. element_blank() - Modifica para "Nada". Usado quando não queremos fazer ajustes ou não queremos alocar espaços



p + theme(panel.background = element_blank())

p + theme(axis.title.x = element_blank())

p + theme(axis.title.y = element_blank())

p + theme(axis.line = element_line(colour = "grey50"))

p + theme(axis.line = element_blank())
```

# Similar ao que vimos anteriormente, podemos incluir varios argumentos da função theme no mesmo gráfico


p + theme(plot.title = element_text(hjust = 0.5, colour = "grey25"),
          panel.grid.major.y = element_line(colour = "grey"),
          panel.grid.minor = element_blank(),
          panel.background = element_blank(),
          axis.line = element_line(colour = "black"),
          legend.position = "right")


# Veja em help a diversidade de funcionalidades que a função theme fornece, e  [*aqui*](https://ggplot2-book.org/polishing.html#theme-elements) uma lista de argumentos que podem ser usados na função theme(), juntamente com a função element() correspondente
                                                                                      
# vamos ver como plotamos de uma vez só multiplos graficos. O ggplot possui a função "faced_wrap()", que elegantemente desenha uma seguência de gráficos.

#Para usarmos a função "faced_wrap()", basta adicionar uma nova camada, incluindo a coluna da tabela original que representa os diferentes gráficos. Vamos utilizar os dados "gapminder", pois eles fornecem informações suficiente para exemplificar.

p <- ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))
p + 
  geom_point(aes(color = continent))


p <- ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))
p + 
  geom_point(aes(color = continent))+
  facet_wrap(~continent)

# Podemos definir a disposição dos gráficos indicando o número de linhas ou colunas,

p + 
  geom_point(aes(color = continent))+
  facet_wrap(~continent, nrow = 2)


p + 
  geom_point(aes(color = continent))+
  facet_wrap(~continent, ncol = 2)


# Por fim, vamos ver como armazenamos em arquivo o gráfico criado. Para tanto, usamos a função ggsave(). Esta função sempre armazenará o último gráfico feito usando o pacote ggplot2. Basta indicar o "caminho" onde o arquivo de figura deve ser guardado, adicionando a extensão do arquivo ("eps", "ps", "tex" (pictex), "pdf", "jpeg", "tiff", "png", "bmp", "svg" or "wmf"). 

# É interessante poder definir a altura e largura da figura, através dos argumentos "width" e "height"


ggsave("Figuras/gapminder_continentes.png", width = 5, height = 5)


Exercícios

1. Copie seu script da aula anterior, onde fizemos gráficos sobre a relação peso idade para o sexo masculino e feminino. Faça pelo menos 1 ajuste para cada tipo da função element().

2. Faça uma figura de gráficos multiplos, onde cada gráfico representará a relação peso idade para os alunos de cada semestre.

3. Armazene seu gráfico em uma pasta chamada "Figura", ajustando altura e largura.


fig_1 <- ggplot(data = alunos, mapping = aes(x = idade, y = peso))
fig_2 <- fig_1 +
  geom_point(aes(color = sexo ), size = 5)+
  labs(x = "Idade (anos)",
       y = "Peso (kg)",
       title = "Perfil da turma")+
  ylim(c(40, 100))+
  xlim(c(15, 45))+
  scale_color_manual(values=c("darkgreen", "darkblue"))

fig_2 +
  theme(plot.title = element_text(size = 12, face = "bold", hjust = 1),
        axis.line = element_line(colour = "grey50"),
        panel.background = element_blank())


fig_2 +
  theme(plot.title = element_text(size = 12, face = "bold", hjust = 1),
        axis.line = element_line(colour = "grey50"),
        panel.background = element_blank())+
  facet_wrap(~semestre)
  

ggsave("Figuras/Perfil_turma_semestre.png", width = 5, height = 5)
























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

