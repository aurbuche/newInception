#!/bin/bash

#Configuration file Mariadb
mv /mariadb-server.cnf /etc/mysql/
/etc/init.d/mysql start

#Set password
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY '$DB_PASSWORD';"

#Set DB Wordpress
mysql -u root -p${DB_PASSWORD} -e "CREATE DATABASE $WP_DATABASE"
mysql -u root -p${DB_PASSWORD} -e "CREATE USER '$WP_USER' IDENTIFIED BY '$WP_PASSWORD'"
mysql -u root -p${DB_PASSWORD} -e "GRANT USAGE ON $WP_DATABASE.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD' WITH GRANT OPTION"
mysql -u root -p${DB_PASSWORD} -e "GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD' WITH GRANT OPTION;"

#Import db already set
mysql -u root --password=${DB_PASSWORD} $WP_DATABASE < wpdatabase.sql

#Add user
mysql -u root -p${DB_PASSWORD} -e "INSERT INTO $WP_DATABASE.wp_users (ID, user_login, user_pass, user_nicename, user_email, user_status, display_name)  VALUES ('1', 'SuperUser', MD5('$SUPER_USER_PASSWORD'), 'SuperUser', 'SuperUser@SuperUser.com', '0', 'SuperUser');"
mysql -u root -p${DB_PASSWORD} -e "INSERT INTO $WP_DATABASE.wp_usermeta (umeta_id, user_id, meta_key, meta_value) VALUES (1,1,'nickname','SuperUSer'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','1'),(16,1,'session_tokens','a:1:{s:64:\"24fbb85958f8e726722846f7cc9b9e621628b2cbe03c735b172d7a57528a6815\";a:4:{s:10:\"expiration\";i:1632099103;s:2:\"ip\";s:10:\"172.20.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36\";s:5:\"login\";i:1631926303;}}'),(17,1,'wp_dashboard_quick_press_last_post_id','4'),(18,1,'community-events-location','a:1:{s:2:\"ip\";s:10:\"172.20.0.0\";}');"
mysql -u root -p${DB_PASSWORD} -e "INSERT INTO $WP_DATABASE.wp_users (ID, user_login, user_pass, user_nicename, user_email, user_status, display_name)  VALUES ('2', 'User', MD5('$USER_PASSWORD'), 'User', 'User@User.com', '0', 'User');"

#Delete SQL file
rm wpDatabase.sql
