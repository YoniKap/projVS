from website.dbconnect import get_mysql_guitars
import random
import string 
import json


def same(str):
  db = get_mysql_guitars()
  cursor = db.cursor()
  cursor.execute('select product_code from product_catalog.all_products;')
  data = cursor.fetchall()
  for tuple in data:
         if str == tuple[0]:
            return True
  return False       


def generate_code():
 
  notsame=True
  code='#{}{}{}{}'.format(random.choice(string.ascii_uppercase),random.randint(1, 9)
                        ,random.choice(string.ascii_uppercase),random.randint(1, 9)) 
  
  while same(code):
        code='#{}{}{}{}'.format(random.choice(string.ascii_uppercase),random.randint(1, 9)
                              ,random.choice(string.ascii_uppercase),random.randint(1, 9)) 
        

  return code




def Jsonify(top, body, neck, fretboard):
    jsn={"top":top, "body": body, "neck":neck, "fretboard":fretboard}
    
    return json.dumps(jsn)