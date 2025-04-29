#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip header row
  if [[ $YEAR != "year" ]]
  then
    # Insert winner team
    echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT (name) DO NOTHING;")
    
    # Insert opponent team
    echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT (name) DO NOTHING;")
    
    # Insert game
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', (SELECT team_id FROM teams WHERE name='$WINNER'), (SELECT team_id FROM teams WHERE name='$OPPONENT'), $WINNER_GOALS, $OPPONENT_GOALS);")
  fi
done
# Make sure all columns are NOT NULL
echo $($PSQL "ALTER TABLE teams ALTER COLUMN team_id SET NOT NULL, ALTER COLUMN name SET NOT NULL;")
echo $($PSQL "ALTER TABLE games ALTER COLUMN game_id SET NOT NULL, ALTER COLUMN year SET NOT NULL, ALTER COLUMN round SET NOT NULL, ALTER COLUMN winner_id SET NOT NULL, ALTER COLUMN opponent_id SET NOT NULL, ALTER COLUMN winner_goals SET NOT NULL, ALTER COLUMN opponent_goals SET NOT NULL;")