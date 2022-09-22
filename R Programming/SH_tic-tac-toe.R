# Create a script that lets you play a full game of tic-tac-toe
# Written by Sam Hart 9/21/22
# https://github.com/sfhart33/skill-assessments/tree/main/R%20Programming
# Here on my system: /home/shart/BRN

# ensure that the script works regardless of RStudio/Rscript
    if (interactive()) {
    con <- stdin()
    } else {
    con <- "stdin"
    }

############################## FUNCTIONS ####################################

# Choose X or O
initial_choice <- function(){
    symbol <<- NA
    cat("X or O? ")
    symbol <<- readLines(con = con, n = 1)
# Make sure its a valid choice
    while (symbol != "X" && symbol != "O") {
        cat("Please only choose X or O! \nX or O? ")
        symbol <<- readLines(con = con, n = 1)
        }
    if(symbol == "X"){opp_sym <<- "O"}
    if(symbol == "O"){opp_sym <<- "X"}
}

# Blank board and winning conditions
game_start <- function(){
    board <<- matrix(ncol = 3, nrow = 3)
    colnames(board) <<- c(1,2,3)
    rownames(board) <<- c(1,2,3)
    tie <<- FALSE
    comp_winner <<- FALSE
    user_winner <<- FALSE
    round_count <<- 1
}

# Function for user input
user_input <- function(){
    cat(paste0(symbol,"'s turn\n"))
    # Define row
    cat("What row? ")
    row_input <<- readLines(con = con, n = 1)
    while (row_input != "1" && row_input != "2" && row_input !=  "3") {
        cat("Please only choose 1:3! \nWhat row? ")
        row_input <<- readLines(con = con, n = 1)
        }
    # Define column
    cat("What column? ")
    col_input <<- readLines(con = con, n = 1)
    while (col_input != "1" && col_input != "2" && col_input !=  "3") {
        cat("Please only choose 1:3! \nWhat column? ")
        col_input <<- readLines(con = con, n = 1)
        }

}

# Function to check to make sure it isn't taken
check_input <- function(){
    #Check whether it's free, re-prompt if not
    while (!is.na(board[row_input,col_input])) {
        cat("That spot is taken!\n")
        # Define row
        cat("What row? ")
        row_input <<- readLines(con = con, n = 1)
        while (row_input != "1" && row_input != "2" && row_input !=  "3") {
            cat("Please only choose 1:3! \nWhat row? ")
            row_input <<- readLines(con = con, n = 1)
            }
        # Define column
        cat("What column? ")
        col_input <<- readLines(con = con, n = 1)
        while (col_input != "1" && col_input != "2" && col_input !=  "3") {
            cat("Please only choose 1:3! \nWhat column? ")
            col_input <<- readLines(con = con, n = 1)
        }
    }

}

# Function for computer input
comp_input <- function(){
    row_comp <<- sample(1:3, 1)
    col_comp <<- sample(1:3, 1)
    while (!is.na(board[row_comp,col_comp])){
        row_comp <<- sample(1:3, 1)
        col_comp <<- sample(1:3, 1)
    }
    cat(paste0(opp_sym,"'s turn\n"))
    cat(paste0(opp_sym," chooses [",row_comp,",",col_comp,"]\n"))
}

# Function to check if anyone has won (or tie)
winner <- function(){
    testU <- board == symbol & !is.na(board)
    testC <- board == opp_sym & !is.na(board)
    if(sum(is.na(board)) == 0){tie <<- TRUE}
    if( sum(testU[1,]) == 3 |
        sum(testU[2,]) == 3 |
        sum(testU[3,]) == 3 |
        sum(testU[,1]) == 3 |
        sum(testU[,2]) == 3 |
        sum(testU[,3]) == 3 |
        sum(c(testU[1,1], testU[2,2], testU[3,3])) == 3 |
        sum(c(testU[3,1], testU[2,2], testU[1,3])) == 3
    ){user_winner <<- TRUE
    tie <<- FALSE}
    if( sum(testC[1,]) == 3 |
        sum(testC[2,]) == 3 |
        sum(testC[3,]) == 3 |
        sum(testC[,1]) == 3 |
        sum(testC[,2]) == 3 |
        sum(testC[,3]) == 3 |
        sum(c(testC[1,1], testC[2,2], testC[3,3])) == 3 |
        sum(c(testC[3,1], testC[2,2], testC[1,3])) == 3
    ){comp_winner <<- TRUE
    tie <<- FALSE}

}

# Function of actual game play
game_play <- function(){
    while(tie == FALSE & comp_winner == FALSE & user_winner == FALSE){
        cat(paste("\nRound", round_count, "\n#############\n"))
        Sys.sleep(1)
        print(board)
        Sys.sleep(1)
        if(symbol == "X"){
            user_input()
            check_input()
            board[row_input,col_input] <<- symbol
            print(board)
            Sys.sleep(1)
            winner()
            if(tie == FALSE & comp_winner == FALSE & user_winner == FALSE){
                comp_input()
                Sys.sleep(1)
                board[row_comp,col_comp] <<- opp_sym
                print(board)
                Sys.sleep(1)
            }
        }
        if(symbol == "O"){
            comp_input()
            board[row_comp,col_comp] <<- opp_sym
            Sys.sleep(1)
            print(board)
            Sys.sleep(1)
            winner()
            if(tie == FALSE & comp_winner == FALSE & user_winner == FALSE){
                user_input()
                check_input()
                board[row_input,col_input] <<- symbol
                print(board)
                Sys.sleep(1)
            }
        }
        round_count <<- round_count + 1
        winner()
    }
    Sys.sleep(1)
    if(tie == TRUE){cat("\nNobody wins - game ends in a tie :(\n")}
    if(user_winner == TRUE){cat("\nUser wins! Don't get cocky - computer placement was random\n")}
    if(comp_winner == TRUE){cat("\nComputer wins! How embarrassing...\n")}
    Sys.sleep(1)
    cat("\nEnding board:\n")
    print(board)
}

############################# RUN THE GAME #################################
    game_start()
    initial_choice()
    game_play()