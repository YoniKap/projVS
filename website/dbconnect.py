
import mysql.connector

mysql_config = {
    'host': '172.17.0.3',
    'user': 'root',
    'password': 'yon133',
    'database': 'users',
    'port': 3306,
}
mysql_guitars={
    'host': '172.17.0.2',
    'user': 'root',
    'password': 'yon133',
    'database': 'product_catalog',
    'port': 3306,
}

def get_mysql_connection():
    return mysql.connector.connect(**mysql_config)

def get_mysql_guitars():
    return mysql.connector.connect(**mysql_guitars)
