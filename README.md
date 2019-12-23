# Show Feeder

## Announcement
This project is officially closed. I cannot find a way to append data onto the Future widget. Additionally, I cannot find a way to sychronize API calls. Blocking occurs in `/mobile/lib/models/data.dart`.

## About
Show Feeder is an application that displays the release dates for
your favorite TV shows and movies.

The **Home** screen renders a list of anticipated shows sorted
by date. Clicking on a show gives you the option to remove it from
your Home list.

The **Favorites** screen renders a list of your favorite shows.

The **Add Show** screen enables you to add your own show.

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

4. Run Node.js server.
```bash
npm start
```

5. Check site at `localhost:3000/get/shows` or `localhost:3000/get/favorites`