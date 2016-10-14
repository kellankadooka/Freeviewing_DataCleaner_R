setwd("~/Desktop/CLEANED_DATA/fv021") #set wd

rm(list=ls()) #Clear Enivronement

#####Files read in should be csv file with added index column, for a single participant

df <- read.csv("fv021.csv", header=TRUE, na.string= ".") #

df <- df[- grep("PLAY_SOUND_VIDEO", df$SAMPLE_MESSAGE),] #remove PLAY_SOUND_VIDEO

df  <- df %>% fill(SAMPLE_MESSAGE) #fill sample message column with value from above

df_clean  <- df[grepl("Video Frame number", df$SAMPLE_MESSAGE),]

df_clean$SAMPLE_MESSAGE <- gsub("Video Frame number = ", "", df_clean$SAMPLE_MESSAGE)

df_clean <- df_clean[- grep("adult_fixationX.xvd", df_clean$VIDEO_NAME),]

####CHILD VERSION
#########
#df_clean <- df_clean[- grep("rattle.avi", df_clean$VIDEO_NAME),]
#df_clean <- df_clean[- grep("ballX.xvd", df_clean$VIDEO_NAME),]
#df_clean <- df_clean[- grep("kitten.avi", df_clean$VIDEO_NAME),]
#########
df_clean <- df_clean[order(df_clean$identifier),]

colnames(df_clean)[colnames(df_clean) == 'RECORDING_SESSION_LABEL'] <- 'ID'

colnames(df_clean)[colnames(df_clean) == 'RIGHT_GAZE_X'] <- 'xpos'

colnames(df_clean)[colnames(df_clean) == 'RIGHT_GAZE_Y'] <- 'ypos'

colnames(df_clean)[colnames(df_clean) == 'SAMPLE_MESSAGE'] <- 'vf'

df_clean$X <- NULL
df_clean$VIDEO_NAME <- NULL
df_clean$ID <- gsub("fv0", "", df_clean$ID)
df_clean$ID. <- NULL
df_clean[is.na(df_clean)] <- -9999

listofdf <- split(df_clean, df_clean$identifier) #split by video identifier


for (i in seq_along(listofdf)) {
  filename = paste(i,".csv")
  write.table(listofdf[[i]], filename, sep = ",", col.names = FALSE)
}
#####
#reintroduce files

df_eachvideo <- read.csv("1 .csv", header=FALSE)
value <- df_eachvideo$V6[1]
df_eachvideo$V6 <- df_eachvideo$V6 - value
df_eachvideo$V1 <- NULL
write.table( df_eachvideo, file = "1_021.csv", sep = ",", col.names = FALSE, )

df_eachvideo <- read.csv("2 .csv", header=FALSE)
value <- df_eachvideo$V6[1]
df_eachvideo$V6 <- df_eachvideo$V6 - value
df_eachvideo$V1 <- NULL
write.table( df_eachvideo, file = "2_021.csv", sep = ",", col.names = FALSE, )

df_eachvideo <- read.csv("3 .csv", header=FALSE)
value <- df_eachvideo$V6[1]
df_eachvideo$V6 <- df_eachvideo$V6 - value
df_eachvideo$V1 <- NULL
write.table( df_eachvideo, file = "3_021.csv", sep = ",", col.names = FALSE, )

df_eachvideo <- read.csv("4 .csv", header=FALSE)
value <- df_eachvideo$V6[1]
df_eachvideo$V6 <- df_eachvideo$V6 - value
df_eachvideo$V1 <- NULL
write.table( df_eachvideo, file = "4_021.csv", sep = ",", col.names = FALSE, )

df_eachvideo <- read.csv("5 .csv", header=FALSE)
value <- df_eachvideo$V6[1]
df_eachvideo$V6 <- df_eachvideo$V6 - value
df_eachvideo$V1 <- NULL
write.table( df_eachvideo, file = "5_021.csv", sep = ",", col.names = FALSE, )

df_eachvideo <- read.csv("6 .csv", header=FALSE)
value <- df_eachvideo$V6[1]
df_eachvideo$V6 <- df_eachvideo$V6 - value
df_eachvideo$V1 <- NULL
write.table( df_eachvideo, file = "6_021.csv", sep = ",", col.names = FALSE, )

df_eachvideo <- read.csv("7 .csv", header=FALSE)
value <- df_eachvideo$V6[1]
df_eachvideo$V6 <- df_eachvideo$V6 - value
df_eachvideo$V1 <- NULL
write.table( df_eachvideo, file = "7_021.csv", sep = ",", col.names = FALSE, )
#

#Still need to remove points of null (-9999) and range outside of screen?


#####
#extra tid bits not used
write.table( df_clean, file = "1_013.csv", sep = ",", col.names = FALSE, )
write.table( df_clean, file = "1_013.csv", sep = ",", col.names = FALSE, )
lapply(names(psplit), function(x) 
  write.csv(psplit[[x]], file = paste(x, ".csv", collapse = "")  #create csv for each participant
)
)
