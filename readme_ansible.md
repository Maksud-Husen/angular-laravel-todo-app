## if you are trying to run app in one server and database in another server FOllOW this readme

## First change the .env.example according to the info given in it 

APP_ENV=local
APP_KEY=SomeRandomString
APP_DEBUG=true
APP_LOG_LEVEL=debug
APP_URL=http://localhost #you can change this to your domain ip from where you want app to run in

DB_CONNECTION=mysql
DB_HOST=<writer_ip_of_db_server> # you can change this to your db server ip
DB_PORT=3306
DB_DATABASE=<your_database_name> 
DB_USERNAME=<your_database_username>
DB_PASSWORD=<your_database_password>

## Then change the ip in the todo.conf inside the Docker folder

## you can change the Docker compose every single information is give in it

## List out your servers in inventory.ini file 
What you need to input it give in it so read proprely

## After filling every requred thing given above then run this command In terminal

-> ansible-playbook -i inventory.ini state.yml 

## MAKE SURE YOU FOLLOW EVERY THINGS GIVEN ABOVE