#!/bin/bash
echo "if you type 'example.com', a folder '/var/www/example.com' will be created "
read PROJECT_NAME

echo "type database name "
read DB_DATABASE


echo "Creating Nginx Virtual Host Configs"
cd /etc/nginx/sites-available/
sudo curl https://gist.githubusercontent.com/mkhleel/6d07d537e60ebcf90b8b92d1a7465fa0/raw/22cffebed244bced57eace19d2c8a489083f67b6/ngnix.stub -o $PROJECT_NAME
sudo sed -i -e "s/\${PROJECT_NAME}/$PROJECT_NAME/" $PROJECT_NAME
sudo ln -s /etc/nginx/sites-available/$PROJECT_NAME /etc/nginx/sites-enabled/
sudo nginx -t
sudo service nginx restart


echo "Creating Database "
echo "create database ${DB_DATABASE} charset utf8mb4; flush privileges;" | mysql -uroot -p123qweasdzxc


echo "Installing Laravel dependencies (composer etc..)"
cd /home/m5lil/Sites/$PROJECT_NAME/
composer install -q
chmod -R 777 storage bootstrap/cache
# chown -R www-data: .

echo "Generating Laravel key"
php -r "file_exists('.env') || copy('.env.example', '.env');"
php artisan key:generate


echo "Modifying .env with your DB credentials"
sed -i -e "s/DB_DATABASE=laravel/DB_DATABASE=$DB_DATABASE/" .env
sed -i -e "s/DB_USERNAME=root/DB_USERNAME=root/" .env
sed -i -e "s/DB_PASSWORD=/DB_PASSWORD=123qweasdzxc/" .env


echo "Migrate and Seed Database"
php artisan migrate --seed



