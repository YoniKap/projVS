from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField ,IntegerField 
from wtforms.validators import DataRequired
from flask_login import LoginManager, UserMixin


class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Login')

class ElectricGuitarForm(FlaskForm):
    brand = StringField('brand', validators=[DataRequired()])
    model = StringField('model', validators=[DataRequired()])   
    shape = StringField('shape', validators=[DataRequired()])
    top = StringField('top', validators=[DataRequired()])
    body = StringField('body', validators=[DataRequired()])
    neck = StringField('neck', validators=[DataRequired()])
    fretboard = StringField('fretboard', validators=[DataRequired()])
    frets = IntegerField('frets', validators=[DataRequired()])
    strings = StringField('strings', validators=[DataRequired()])
    pickupnum = IntegerField('pickupnum', validators=[DataRequired()])
    pickuptype = StringField('pickuptype', validators=[DataRequired()])
    bridge = StringField('bridge', validators=[DataRequired()])
    price = IntegerField('price', validators=[DataRequired()])
    submit = SubmitField('submit')
      
class AcousticGuitarForm(FlaskForm):
    brand = StringField('brand', validators=[DataRequired()])
    model = StringField('model', validators=[DataRequired()])   
    shape = StringField('shape', validators=[DataRequired()])
    top = StringField('top', validators=[DataRequired()])
    body = StringField('body', validators=[DataRequired()])
    neck = StringField('neck', validators=[DataRequired()])
    fretboard = StringField('fretboard', validators=[DataRequired()])
    frets = IntegerField('frets', validators=[DataRequired()])
    strings = StringField('strings', validators=[DataRequired()])
    pickupnum = IntegerField('pickupnum', validators=[DataRequired()])
    pickuptype = StringField('pickuptype', validators=[DataRequired()])
    price = IntegerField('price', validators=[DataRequired()])
    submit = SubmitField('submit')

class BassGuitarForm(FlaskForm):
    brand = StringField('brand', validators=[DataRequired()])
    model = StringField('model', validators=[DataRequired()])   
    type = StringField('model', validators=[DataRequired()])
    shape = StringField('shape', validators=[DataRequired()])
    top = StringField('top', validators=[DataRequired()])
    body = StringField('body', validators=[DataRequired()])
    neck = StringField('neck', validators=[DataRequired()])
    fretboard = StringField('fretboard', validators=[DataRequired()])
    frets = IntegerField('frets', validators=[DataRequired()])
    strings = StringField('strings', validators=[DataRequired()])
    pickupnum = IntegerField('pickupnum', validators=[DataRequired()])
    pickuptype = StringField('pickuptype', validators=[DataRequired()])
    price = IntegerField('price', validators=[DataRequired()])
    submit = SubmitField('submit')

class OtherForm(FlaskForm):
    brand = StringField('brand', validators=[DataRequired()])
    model = StringField('model', validators=[DataRequired()])   
    type = StringField('model', validators=[DataRequired()])
    price = IntegerField('price', validators=[DataRequired()])
    submit = SubmitField('submit')




class hm(FlaskForm):
    submit = SubmitField('next')
 



class User(UserMixin):
    def __init__(self, user_id):
        self.id = user_id


    def is_active(self):
        return True    