from flask import render_template, redirect, jsonify
from flask import request
from flask_login import login_user, logout_user, login_required, current_user
from app import app
from app.models import User, Database

from . import mysql


@app.route('/')
def index():
    return render_template("index.html")

@app.route('/about')
def about():
    return render_template("about.html")

@app.route('/signup',methods=['GET','POST'])
def signup():
    if request.method == 'GET':
        return "signup form"
    else:
        #verify details
        data = request.get_json()
        if Database.addUser(data):
            return "User added successfully"
        else:
            return "Error"

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    #verify user
    if Database.login(username, password):
        user = User(username, access)
        login_user(user)
        return redirect("/"+username)
    else:
        return "Incorrect credentials. Please try again."
   
@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect("/")

@app.route("/<username>")
@login_required
def home(username):
    data = Database.getUser(username)
    return jsonify(data)

	
@app.route("/bids/<pname>")
def bids(pname):
	#fetch details of pname and send it in this json
	project = {'name':pname}
	return render_template('bid.html', project = project)
	
@app.route("/makebid/<pname>")
def makebid(pname):
	#get required details needed for the project and accordingly populate the form queries
	project = {'name':pname}
	return render_template('makebid.html', project = project)
	
@app.route("/bidplaced", methods=['POST'])
def bidplaced():
	return "A"

@app.route("/addproject", methods=['POST'])
@login_required
def addProject():
    if current_user.access == "admin":
        projDetails = request.get_json()
        #verify Data parameters
        if Database.addProject(data):
        #if successful
            return "Data saved successfully"
        else:
            return "Error saving data"
    return "Access denied" 

@app.route("/project/<project>", methods=['GET'])
def showProject(project):
    data = Database.getProject(project)
    if data is not False:
        return jsonify(data)
    else:
        return "Project not found"
