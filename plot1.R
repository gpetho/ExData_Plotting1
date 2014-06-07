df <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
df[1] <- as.Date(df[,1], format="%d/%m/%Y")
rel1 <- df[df[1] == "2007-02-01",]
rel2 <- df[df[1] == "2007-02-02",]
rel <- rbind(rel1, rel2)
active <- as.numeric(unlist(rel[3]))
png("plot1.png")
hist(active, col="red", xlab="Global Active Power (kilowatts)", breaks=12, main="Global Active Power")
dev.off()