df <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
df[1] <- as.Date(df[,1], format="%d/%m/%Y")
rel1 <- df[df[1] == "2007-02-01",]
rel2 <- df[df[1] == "2007-02-02",]
rel <- rbind(rel1, rel2)
dt <- paste(rel[,1], rel[,2])
times <- strptime(unlist(dt), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png("plot3.png")
plot(times, unlist(as.numeric(rel[,7])), type="l", xlab="", ylab="Energy Sub Metering")
points(times, unlist(as.numeric(rel[,8])),type="l", col="red")
points(times, unlist(as.numeric(rel[,9])),type="l", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
dev.off()