from flask_login import UserMixin
from . import login_manager, mysql

class User(UserMixin):
    def __init__(self, username, access):
        self.username = username
        self.access = access
    def __repr__(self):
        return '<User %r>' % self.username

    def get_id(self):
        return self.username

@login_manager.user_loader
def load_user(username):
    cur = mysql.connection.cursor()
    cur.execute("Select username,password from login where username='"+username+"'")
    data = cur.fetchone()
    return User(data[0],data[1])

class Database():
    def login(username,password):
        cur = mysql.connection.cursor()
        cur.execute("Select * from login where username='"+username+"' and password='"+password+"'")
        data = cur.fetchone()
        if data:
            return True
        else:
            return False

    def getUser(username):
        cur = mysql.connection.cursor()
        cur.execute("Select * from admin where username ='"+ username+"'")
        try:
            data = cur.fetchone()
            return data
        except ProgrammingError:
            cur.execute("Select * from vender where username ='"+username+"'")
            try:
                data = cur.fetchone()
                return data
            except ProgrammingError:
                return "No data found"

