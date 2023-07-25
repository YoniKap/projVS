from flask import Flask ,request , render_template
from flask_wtf import CSRFProtect
from website.forms import LoginForm
from flask_login import LoginManager

app = Flask(__name__, template_folder="website/templates")


csrf = CSRFProtect(app)

app.config['SECRET_KEY'] = 'thiskeyistopsecretnooneknowsitnotevensleepyjoe'


from website.views import views
from website.auth import auth 

app.register_blueprint(views, url_prefix='/')
app.register_blueprint(auth, url_prefix='/')

from website.forms import User

login_manager = LoginManager()
login_manager.login_view = 'auth.login'
login_manager.init_app(app)

@login_manager.user_loader
def load_user(username):
    return User(username)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)