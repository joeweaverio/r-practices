install.packages("data.table")
library(data.table);

<<<<<<< HEAD
set.seed(12)

#create DF with x, y, z variable
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9));
head(DF,3);

#create DT with x, y, z variable
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9));
head(DT,3);

#See all the data tables in memory
tables()

#Subsetting rows
DT[2,]

DT[DT$y=="a",]
DT[c(2,3)]
DT[,c(2,3)]


#Column subsetting in data.table

{ x = 1 
y = 2 } 
k = {print(10); 5}
print(k)

#Calculating values for variables with expressions
#notice passing a list as your arg
DT[,list(mean(x),sum(z))]

DT[,table(y)]

#Adding new columns
#w is the new column name, := is how you assign the values for the new column
DT[,w:=z^2]

#watch for this when you think your copying to a new var
#DT2 will have be like a mirror to DT

DT2 <- DT 
DT[, y:= 2]

head(DT,n=3)
head(DT2,n=3)

#use this to make a unique copy of the object
data.table::copy(DT) -> DT3;
DT[, b:=a*2];

#Multiple operations
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]

#plyr like operations
DT[,a:=x>0]
DT[,b:= mean(x+w),by=a]


#Special variables
#by= - like a group by,  .N - is An integer, length 1, containing the number of elements of a factor level
set.seed(123); 
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE));
DT[, .N, by=x]

#Keys 
#this will set a primary index key
#setkey()

DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300));
setkey(DT, x);
DT['a']

#Join
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x);
setkey(DT2, x)
merge(DT1, DT2)



big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
#this is faster
system.time(fread(file))
system.time(read.table(file, header=TRUE, sep="\t"))



=======
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9));
head(DF,3);

DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9));
head(DT,3);
>>>>>>> b7fa314bc23ca29f20fa43dbfea959bd97f32b00
