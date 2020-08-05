name <- "Ayobami Elizabeth Adeniyi"
email <- "ayobamiadeniyi1517@gmail.com"
biostack <- "Drug Discovery"
username <- "@Ayobami1517"
language <- "R"

data <- data.frame(Information=c(name, email, biostack, username, language))

rownames(data) <- c('NAME: ', 'E-MAIL: ', 'BIOSTACK: ','USERNAME: ',
                    'LANGUAGE: ')
colnames(data) <- NULL
print(data)
