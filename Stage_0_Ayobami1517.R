name <- "Ayobami Elizabeth Adeniyi"
email <- "ayobamiadeniyi1517@gmail.com"
biostack <- "Drug Discovery"
username <- "@Ayobami1517"
language <- "R"

data <- data.frame(Information=c(name, email, language, biostack, username))

rownames(data) <- c('NAME: ', 'E-MAIL: ', 'LANGUAGE: ', 'BIOSTACK: ', 'USERNAME: ')

colnames(data) <- NULL
print(data)
