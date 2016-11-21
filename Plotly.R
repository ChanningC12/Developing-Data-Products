# plotly: web application, works on R, Python, Excel

install.packages("plotly")
library(plotly)

# basic scatterplot
plot_ly(mtcars,x=wt,y=mpg,mode="markers")

# scatterplot by color
plot_ly(mtcars,x=wt,y=mpg,mode="markers",color=as.factor(cyl))
plot_ly(mtcars,x=wt,y=mpg,mode="markers",color=disp)

# scatterplot sizing
plot_ly(mtcars,x=wt,y=mpg,mode="markers",color=as.factor(cyl),size=hp)

# 3D scatterplot
set.seed(2016-07-21)
temp = rnorm(100,mean=30,sd=5)
pressue = rnorm(100)
dtime=1:100
plot_ly(x=temp,y=pressue,z=dtime,type="scatter3d",mode="markers",color=temp)

# Line Graph
plot_ly(x=time(airmiles),y=airmiles)

library(tidyr)
library(dplyr)
data(EuStockMarkets)
head(EuStockMarkets)
stocks = as.data.frame(EuStockMarkets) %>% # %>% works to chain function together
    gather(index,price) %>% # convert wide to long, tidyr package
    mutate(time=rep(time(EuStockMarkets),4))
    
plot_ly(stocks,x=time,y=price,color=index)


# histogram
plot_ly(mtcars,x=cyl,type="histogram")

# boxplot
plot_ly(iris,y=Petal.Length,color=Species,type="box")

# Heatmap
terrain1 = matrix(rnorm(10*10),nrow=10,ncol=10)
plot_ly(z=terrain1,type="heatmap")

# 3D Surface
terrain2 = matrix(sort(rnorm(10*10)),nrow=10,ncol=10)
plot_ly(z=terrain2,type="surface")


# Choropleth Maps
state_pop = data.frame(State=state.abb,Pop=as.vector(state.x77[,1])) # state vs population
head(state_pop)
# create the hover text
state_pop$hover = with(state_pop, paste(State,'<br>',"Population:",Pop))
# Make state borders red
borders = list(color=toRGB("red"))
# Set up some mapping options
map_options = list(
    scope = 'usa',
    projection = list(type='albers usa'),
    showlakes = T,
    lakecolor = toRGB('white')
    )

plot_ly(state_pop,z=Pop,text=hover,locations=State,
        type="choropleth",locationmode='USA-states',
        color=Pop,colors='Blues',marker=list(line=borders)) %>%
    layout(title='US Population in 1975',geo=map_options)

# ggplot
set.seed(100)
d = diamonds[sample(nrow(diamonds),1000),]
p = ggplot(data=d,aes(x=carat,y=price)) + 
    geom_point(aes(text = paste("Clarity:",clarity)), size=4) +
    geom_smooth(aes(colour=cut,fill=cut)) + facet_wrap(~cut)
p

(gg<-ggplotly(p))

# post plotly









