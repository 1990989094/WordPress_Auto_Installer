sudo apt install mysql-server -y
currentuser= whoami
echo "Enter the password of mysql database for user-" $currentuser
read password
getstatus_mysql= systemctl show -p SubState --value mysql
if [ $getstatus_mysql != "running" ]; then
    service mysql start
fi
mysql --user="$currentuser" --execute="SET GLOBAL validate_password.policy=LOW;"
mysql --user="$currentuser" --execute="ALTER USER $currentuser@'localhost' IDENTIFIED BY 'password123#';"

