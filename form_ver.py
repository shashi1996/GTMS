from flask_wtf import Form
from wtforms import TextField, SubmitField, PasswordField
   SelectField

from wtforms import validators, ValidationError

class VerifForm(Form):
   company = TextField("Company",[validators.Required("Please enter the company name.")])
   url = TextField("url",[validators.Required("Please enter the company url.")])
   UserName = TextField("UserName",[validators.Required("Please enter the username.")])
   password = PasswordField("password",[validators.Required("Please enter valid password")])
   ConfirmPassword = PasswordField("ConfirmPassword",[validators.Required("Please enter matching password")])
   UserName = TextField("UserName",[validators.Required("Please enter the username.")])
   FullName = TextField("FullName",[validators.Required("Please enter your fullname.")])
   submit = SubmitField("submit")