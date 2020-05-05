mysql -uroot < exec_sql.sql
sysbench $PWD/sysbench/src/lua/oltp_read_only.lua --threads=4 --mysql-user=sbtest --mysql-host=127.0.0.1 --tables=10 --table-size=1000 prepare
sysbench $PWD/sysbench/src/lua/oltp_read_only.lua --threads=16 --events=0 --time=300 --mysql-host=127.0.0.1 --mysql-user=sbtest --tables=10 --table-size=1000 --range_selects=off --db-ps-mode=disable --report-interval=1 run
