# Show Feeder

## About
Show Feeder is an application that displays the release dates for
your favorite TV shows and movies.

The **Home** screen renders a list of anticipated shows sorted
by date. Clicking on a show gives you the option to remove it from
your Home list.

The **Favorites** screen renders a list of your favorite shows.

The **Add Show** screen enables you to add your own show.

## Specs
* Move all HTTP methods within the specific widget classes; I will depend on
  the widgets to fetch API's at every screen change (unfortunately)
* Must add authentication. Have user authentication cached forever.
* Add Shows - Implement the POST request for anticipated show.
* Home - should refresh data after detecting a database change.
* Infrastructure - ding a notification at show's release date at 9 AM.
* Hosting - see RedHat Openshift; note I must resubscribe every 2 hours. Make
  documentation how to rehost the server. Simply use the Docker image.

## Server Setup
1. Modify configuration settings.
```bash
mv server/skeleton-configs.js server/configs.js
nano server/configs.js
```

2. Install `mysql`.
```bash
sudo apt install mysql-server
sudo mysql -u root
mysql> SELECT User,Host FROM mysql.user;
mysql> DROP USER 'root'@'localhost';
mysql> CREATE USER 'root'@'localhost' IDENTIFIED BY 'YOUR_PASSWORD';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;
mysql> exit;
mysql -u root -pYOUR_PASSWORD < server/drop_create_tables.sql
```

3. Install npm packages.
```bash
npm install --prefix server/
```

4. Run Node.js server. TODO: Make sure below commands are updated
```bash
sudo apt install pw2
```
