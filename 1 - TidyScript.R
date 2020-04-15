
# This Script standardizes data formats for the HOBO temperature Loggers. Data exported from plots should go in the S205down (serial numbers) folder as they have a record column to be removed. Data from hobomobile exprots should go in the S206up folder as they have several extra columns to be removed.
# The script will overwrite the files in the specified working directories.


#install.packages("tidyverse")
library(tidyverse)

####################### Process the plot export data #################################

setwd("C:/Users/jmorris/Desktop/Hobo_Calibration/For_Processing/S205down")

files <- dir(pattern = "*.csv")
files

dtmn.fn<-function(x){
  x
  serial<-substr(x,1,8)
  serial
  x.df<-read_csv(x,skip=2, col_names = F)
  x.df
  colnames(x.df) <- c("record","datetime", "tempC")
  x.df$serial <- serial
  x.df <- subset(x = x.df, select = -c(record))
  filenm <- paste(serial, ".csv", sep = "")
  filenm
  write_csv(x.df,filenm)
  return(x.df)
}

lapply(files, dtmn.fn)


########################### Process Hobomobile export data #####################

setwd("C:/Users/jmorris/Desktop/Hobo_Calibration/For_Processing/S206up")

files <- dir(pattern = "*.csv")
files

dtmn.fn<-function(x){
  x
  serial<-substr(x,1,8)
  serial
  x.df<-read_csv(x,skip=3, col_names = F)
  x.df
  x.df <- subset(x = x.df, select = c(X1,X2))
  colnames(x.df) <- c("datetime", "tempC")
  x.df$serial <- serial
  filenm <- paste(serial, ".csv", sep = "")
  filenm
  write_csv(x.df,filenm)
  return(x.df)
}


lapply(files, dtmn.fn)
