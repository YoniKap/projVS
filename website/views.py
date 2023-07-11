from flask import Blueprint ,render_template , request ,redirect ,url_for
from flask_login import login_user , login_required , logout_user , current_user
from website.forms import hm , ElectricGuitarForm
from website.dbconnect import get_mysql_guitars
from website.functions import  Jsonify , generate_code
from mysql.connector import Error



views = Blueprint( 'views' , __name__ ) 



@views.route('/departments', methods=['GET','POST'])
@login_required
def departments():
    return render_template("departments.html")






@views.route('/electric')
@login_required
def electric():
    db =get_mysql_guitars()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM product_catalog.electric_guitars;')
    data = cursor.fetchall()
    
    return render_template("electric.html",data=data)


@login_required
@views.route('/add_electric', methods=['GET', 'POST'])
def addelectric():
    form = ElectricGuitarForm()
    try:
       db = get_mysql_guitars() 
    except:
       return render_template("databasefail.html")

    if request.method == 'POST' and form.validate_on_submit():
       

        cursor = db.cursor()

        brand = request.form.get('brand')
        model = request.form.get('model')
        shape = request.form.get('shape')
        top = request.form.get('top')
        body = request.form.get('body')
        neck = request.form.get('neck')
        fretboard = request.form.get('fretboard')
        frets = request.form.get('frets')
        strings = request.form.get('strings')
        pickupnum = request.form.get('pickupnum')
        pickuptype = request.form.get('pickuptype')
        bridge = request.form.get('bridge')
        price = request.form.get('price')
        print(brand, model, shape, top, body, neck,fretboard ,frets, strings,pickupnum,pickuptype, bridge, price)

        woods=Jsonify(top, body, neck, fretboard)
        code= generate_code()


        query = '''INSERT INTO product_catalog.electric_guitars
                   (product_code, brand, model, neck_shape, woods, num_of_frets, num_of_strings, num_of_pickups, pickup_type, bridge_type, price, in_stock)
                   VALUES ('{}', '{}', '{}', '{}', '{}', {}, {}, {}, '{}', '{}', {}, 0);'''.format(code, brand, model, shape, woods, frets, strings, pickupnum, pickuptype,bridge, price)
            
            
                
        cursor.execute(query)
        db.commit()
        db.close() 
        return "Guitar successfully added to the database"
    
        
        

        
        

        
    return render_template("addelectric.html", form=form)





@login_required
@views.route('/add_acoustic', methods=['GET', 'POST'])
def addacoustic():
    form = ElectricGuitarForm()
    try:
       db = get_mysql_guitars() 
    except:
       return render_template("databasefail.html")

    if request.method == 'POST' and form.validate_on_submit():
       

        cursor = db.cursor()

        brand = request.form.get('brand')
        model = request.form.get('model')
        shape = request.form.get('shape')
        top = request.form.get('top')
        body = request.form.get('body')
        neck = request.form.get('neck')
        fretboard = request.form.get('fretboard')
        frets = request.form.get('frets')
        strings = request.form.get('strings')
        pickupnum = request.form.get('pickupnum')
        pickuptype = request.form.get('pickuptype')
        bridge = request.form.get('bridge')
        price = request.form.get('price')
        print(brand, model, shape, top, body, neck,fretboard ,frets, strings,pickupnum,pickuptype, bridge, price)

        woods=Jsonify(top, body, neck, fretboard)
        code= generate_code()


        query = '''INSERT INTO product_catalog.acoustic_guitars
                   (product_code, brand, model, neck_shape, woods, num_of_frets, num_of_strings, num_of_pickups, pickup_type, bridge_type, price, in_stock)
                   VALUES ('{}', '{}', '{}', '{}', '{}', {}, {}, {}, '{}',  {}, 0);'''.format(code, brand, model, shape, woods, frets, strings, pickupnum, pickuptype, price)
            
        print(query)    
                
        cursor.execute(query)
        db.commit()
        db.close() 
        return "Guitar successfully added to the database"
    
        
        

        
        

        
    return render_template("addacoustic.html", form=form)






@views.route('/acoustic')
@login_required
def acoustic():
    db =get_mysql_guitars()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM product_catalog.acoustic_guitars;')
    data = cursor.fetchall()
    print(data)
    return render_template("acoustics.html",data=data)



@views.route('/classical')
@login_required
def classical():
   db =get_mysql_guitars()
   cursor = db.cursor()
   cursor.execute('SELECT * FROM product_catalog.classical_guitars;')
   data = cursor.fetchall()
    
   return render_template("classical.html",data=data)


@views.route('/bass')
@login_required
def bass():
    return render_template("bass.html")

