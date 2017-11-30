from flask import Flask, render_template
from forms import VeriForm
app = Flask(__name__)
app.secret_key = 'BruceWayneIsBatMan'

@app.route('/register')
def register():
   form = VeriForm()
   return render_template('register.html', form = form)

if __name__ == '__main__':
   app.run(debug = True)