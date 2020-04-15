#install.packages("tidyverse")
library(tidyverse)


###################### Load up and bind data from each set #######################

setwd("C:/Users/jmorris/Desktop/Hobo_Calibration/For_Processing/S205down")
files1 <- dir(pattern = "*.csv")

data.rw1 <-  files1 %>% # load up all files into a longform df
  map(read_csv) %>% 
  reduce(rbind) 

setwd("C:/Users/jmorris/Desktop/Hobo_Calibration/For_Processing/S206up")
files2 <- dir(pattern = "*.csv")

data.rw2 <-  files2 %>% # load up all files into a longform df
  map(read_csv) %>% 
  reduce(rbind) 

################## Bind it all together and write the csv file to analysis folder #################
setwd("C:/Users/jmorris/Desktop/Hobo_Calibration")

data <- rbind(data.rw1,data.rw2)

write_csv(data, "C:/Users/jmorris/Desktop")


