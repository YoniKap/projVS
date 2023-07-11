from flask import Blueprint, render_template, request ,redirect,url_for ,current_app
from website.forms import LoginForm ,User
from website.dbconnect import get_mysql_connection
from flask_login import login_user , login_required , logout_user , current_user


auth = Blueprint('auth', __name__)


@auth.route('/', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        db = get_mysql_connection()
        cursor = db.cursor()
        query = "SELECT * FROM users.userdata WHERE username = %s AND password = %s"
        cursor.execute(query, (username, password))
        result = cursor.fetchall()
        cursor.close()
        db.close()
        if result:
            user = User(username)
            login_user(user, remember=True)
            return redirect(url_for('views.departments'))
        else:
            return render_template('login.html', form=form, error='Invalid credentials')

    return render_template('login.html', form=form)




@auth.route('/logout')
@login_required
def logout():
    logout_user
    return redirect(url_for('auth.login'))

