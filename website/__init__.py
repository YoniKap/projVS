from flask import Flask

def create_app():
    app = Flask(__name__)
    
    app.config['SECRET_KEY']='hasdasdfaskfgjneahbnrstgrpsefdngdfpigoahdofnvdsvf'

    from views import views
    from auth  import auth

    app.register_blueprint(views , url_prefix='/') 
    app.register_blueprint(views , url_prefix='/auth') 


    return app
   
