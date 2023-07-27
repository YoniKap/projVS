
import mysql.connector
from dotenv import  load_dotenv
import os
print(os.getenv("GUITARHOST") , os.getenv("GUITARUSER"), os.getenv("GUITAPASS"), os.getenv("GUITADB"))
load_dotenv()
mysql_config = {
    'host': os.getenv("USERHOST"),
    'user': os.getenv("USERUSER"),
    'password': os.getenv("USERPASS"),
    'database': os.getenv("USERDB"),
    'port': os.getenv("USERPORT" ,3306),
}
mysql_guitars={
    'host': os.getenv("GUITARHOST"),
    'user': os.getenv("GUITARUSER"),
    'password': os.getenv("GUITARPASS"),
    'database': os.getenv("GUITARDB"),
    'port': os.getenv("GUITARPORT" ,3306),
}

def get_mysql_connection():
    return mysql.connector.connect(**mysql_config)

def get_mysql_guitars():
    return mysql.connector.connect(**mysql_guitars)
