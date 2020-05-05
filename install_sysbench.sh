sudo apt -y install make automake libtool pkg-config libaio-dev
sudo apt -y install libmysqlclient-dev libssl-dev

git clone https://github.com/akopytov/sysbench.git
cd sysbench 
./autogen.sh
./configure
make -j32
sudo make install

