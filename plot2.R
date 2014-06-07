df <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
df[1] <- as.Date(df[,1], format="%d/%m/%Y")
rel1 <- df[df[1] == "2007-02-01",]
rel2 <- df[df[1] == "2007-02-02",]
rel <- rbind(rel1, rel2)
dt <- paste(rel[,1], rel[,2])
times <- strptime(unlist(dt), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png("plot2.png")
plot(times, active, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()