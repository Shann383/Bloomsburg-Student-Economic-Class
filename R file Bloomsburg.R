## ----message=F,warning=FALSE---------------------------------------
library(dplyr)
library(ggplot2)

# Load data
mobility_data <-  read.csv('C:\\Users\\roryq\\Downloads\\mobility_data.csv')

# Select school and view key data
mobility_data %>% filter(name == 'Bloomsburg University Of Pennsylvania') %>% select(college_opeid,type,tier,iclevel,state,region)


## ------------------------------------------------------------------
# Create data set with school
# Select columns for transition matrix 
bloom<-mobility_data %>% filter(name == 'Bloomsburg University Of Pennsylvania') %>% select(kq1_cond_parq1:kq5_cond_parq5)



## ------------------------------------------------------------------

# Convert to vector
bloom_vec <- unlist(bloom)

# Create new matrix from vector and name columns/rows accordingly
B <- matrix(data = bloom_vec, nrow = 5, ncol = 5,
byrow = FALSE, dimnames = list(c("Student Q1",
"Student Q2", "Student Q3", "Student Q4",
"Student Q5"), c("Parents Q1", "Parents Q2",
"Parents Q3", "Parents Q4", "Parents Q5")))

B


## ------------------------------------------------------------------

# Create Generation 0 (parental quintile distribution) select parental columns
G0_data = mobility_data %>%
filter(name == 'Bloomsburg University Of Pennsylvania') %>%
select(par_q1:par_q5)

# Convert from df to vector
G0_vec <- unlist(G0_data)

# Convert vector to matrix 
G0 <- matrix(data = G0_vec, nrow = 5, ncol = 1,
byrow = FALSE, dimnames = list(c("Q1",
"Q2", "Q3", "Q4", "Q5"), c(" ")))

G0


## ------------------------------------------------------------------
# Find generation 1 of students who end up in each terciles by multiplying generation 0 by the transition matrix
G1 <- B %*% G0
G1


## ------------------------------------------------------------------

# Create K and P columns
gen0 <- cbind(G0, rep(0, 5),   # rep the number 0 five times
              seq(1, 5, 1))    # list numbers 1 to 5 by 1s
gen1 <- cbind(G1, rep(1, 5),   # rep the number 1 (for gen 1) five times (bc quitiles)
              seq(1, 5, 1))    # list numbers 1 to 5 by 1 (label each quintile)

# Check gen 1 data
gen1


## ------------------------------------------------------------------

# Combine gen1 data and gen 2 data vertically so that we can make grouped by graph by generations
chart_matrix <- rbind(gen0, gen1)

# Name columns in new matrix
colnames(chart_matrix) <- c("share", "generation",
"quintile")

# Leave row name empty
rownames(chart_matrix) <- c(" ", " ", " ",
" ", " ", " ", " ", " ", " ", " ")


## ------------------------------------------------------------------
# make matrix into dataframe to graph
chart_data <- as.data.frame(chart_matrix)


## ------------------------------------------------------------------
ggplot(chart_data, aes(x = quintile,
y = share, fill = factor(generation))) +
geom_col(position = "dodge") + labs(x = "Quintile",
y = "Share in Quintile", fill = "Generation",
title = "Share of Parents and Students in each Income Quintile",
subtitle = "Bloomsburgh University")



