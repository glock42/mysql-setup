sudo apt install -y cmake build-essential libreadline6-dev libncurses5-dev
sudo groupadd mysql
sudo useradd -r -g mysql mysql

wget https://downloads.mysql.com/archives/get/p/23/file/mysql-8.0.19.tar.gz
tar xvfz mysql-8.0.19.tar.gz
cd mysql-8.0.19/

mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-8.0.19 -DDOWNLOAD_BOOST=1 -DWITH_BOOST=$PWD -DWITH_INNOBASE_STORAGE_ENGINE=1-DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DMYSQL_UNIX_ADDR=/tmp/mysql.sock -DSYSCONFDIR=/etc ..
make -j32
sudo make install

sudo ln -s /usr/local/mysql-8.0.19/ /usr/local/mysql

export PATH=$PATH:/usr/local/mysql/bin

sudo cp my.cnf /etc/my.cnf
sudo chown $USER /etc/my.cnf

sudo mkdir /mnt/mysql
sudo mkdir /mnt/mysql/data
sudo chown -R $USER /mnt/mysql

cd /usr/local/mysql
sudo cp /usr/local/mysql/share/english/errmsg.sys /usr/share/errmsg.sys
sudo chown mysql /usr/share/errmsg.sys


./bin/mysqld --defaults-file=/etc/my.cnf  --initialize-insecure --user=mysql
./bin/mysqld_safe --user=mysql &
