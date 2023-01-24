FROM mysql:5.7

COPY low-memory-mysql.cnf /etc/mysql/conf.d/low-memory-mysql.cnf