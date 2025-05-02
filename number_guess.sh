#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Lookup user
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# If user doesn't exist, insert and greet
if [[ -z $USER_ID ]]; then
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


# Generate secret number
SECRET_NUMBER=$((1 + RANDOM % 1000))
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

# Game loop
while true; do
  read GUESS
  ((GUESS_COUNT++))

  # Check input is integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Compare guess
  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
  echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
  $PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS_COUNT)" > /dev/null
  break
fi
done
