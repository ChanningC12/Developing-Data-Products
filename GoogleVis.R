# Google Vis API
install.packages("googleVis")
library(googleVis)
## Example
suppressPackageStartupMessages(library(googleVis))
# assign gvis chart to Fruit
M = gvisMotionChart(Fruits,"Fruit","Year",options=list(width=600,height=400))
plot(M)
print(M,"chart") # give you the relevant html page

# Motion chart: givsMotionChart
# Interactive maps: givsGeochart
# Interactive tables: gvisTable
# Line charts: gvisLineChart
# Bar charts: gvisColumnChart
# Tree maps: gvisTreeMap

G = gvisGeoChart(Exports, locationvar="Country",colorvar = "Profit", options=list(width=600, height=400))
plot(G)

# merge multiple plots
T1 = gvisTable(Exports, options=list(width=200,height=270))
GT = gvisMerge(G,T1,horizontal=F)
plot(GT)
GTM = gvisMerge(GT,M,horizontal = T)
plot(GTM)


##### Exports example. specify a region, region = 150 will zoom in WE region
G2 = gvisGeoChart(Exports, locationvar="Country",colorvar = "Profit", 
                 options=list(width=600, height=400, region="150"))
plot(G2)

##### Line chart
df = data.frame(label=c("Full Pay","RBO","NFO"), val1=c(0.85,0.10,0.05), val2=c(1000,150,100))
Line = gvisLineChart(df, xvar="label",yvar=c("val1","val2"),
                     options = list(title="Genworth", legend="bottom"))
plot(Line)


















