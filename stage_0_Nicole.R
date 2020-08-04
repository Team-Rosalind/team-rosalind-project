
name <- 'Nicole Sheen Sanchez'
email <- "alexandra.sheen@unmsm.edu.pe"
language <- 'R'
biostack <- "Genomics"
slackuser <- "@Nicole"
data <- data.frame(Information=c(name, email, language, biostack, slackuser))
rownames(data) <- c('NAME: ', 'E-MAIL: ', 'USED LANGUAGE: ', 'BIOSTACK: ', 'SLACK USERNAME: ')
print(data)


