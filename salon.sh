#! /bin/bash
#echo -e "/n~~~ Salon Services ~~/n"
#PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#MAIN_MENU(){
#  echo -e "\nSelect a service:"
 #SERVICE_RESULT=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id" | sed 's/ *| */) /')
  #echo -e"\n$SERVICE_RESULT\n"
#}
#MAIN_MENU
# Function to display services
#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Main menu function
MAIN_MENU() {
  echo -e "\nWelcome to the Salon. Please select a service:"
  SERVICE_RESULT=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id" | sed 's/ *| */) /')
  echo "$SERVICE_RESULT"

  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  while [[ -z $SERVICE_NAME ]]; do
    echo -e "\nThat is not a valid service. Please select again:"
    SERVICE_RESULT=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id" | sed 's/ *| */) /')
    echo "$SERVICE_RESULT"
    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  done

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]; then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
