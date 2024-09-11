D = read.table("/home/henrik/OneDrive/3. Semester/Sandsynlighedsteori og statistik/Eksempler/Uge2/flymotor.csv", header = TRUE)

tykkelse = D$Tykkelse
median(tykkelse)
quantile(tykkelse)
boxplot(tykkelse, 
        main="title",
        horizontal = TRUE,
        xlab = "x-axis",
        color = "blue")
