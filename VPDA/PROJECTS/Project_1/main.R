if (!require("dplyr")) install.packages("dplyr")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("readxl")) install.packages("readxl")
if (!require("infotheo")) install.packages("infotheo")
library(dplyr)
library(ggplot2)
library(readxl)
library(infotheo)
#dirname = paste0(dirname(dirname(rstudioapi::getActiveProject())),"/DATASETS") 

#if (dir.exists(dirname)){
#  print("True")
  
#} else {
#  print("False")
  
#}
#if (dirname != getwd()){
#  setwd(dirname)  
#}
#rm(dirname)

expenses = read_xlsx("../../DATASETS/Member_Travel_Expenses.xlsx")
show(expenses)

exp_nums = expenses %>% select_if(is.numeric)

pairs( exp_nums )




a <- c(13, 15, 16, 16, 19, 20, 21, 22, 22, 25, 30, 33, 35, 35, 36, 40, 45)
 ## a useful package
x1 <- discretize( a , disc = "equalwidth" , nbins = 4)
x2 <- discretize( a , disc = "equalfreq" , nbins = 4)
identical ( x1 , x2 )