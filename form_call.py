from flask import Flask, render_template, request, flash
from forms import ContactForm
app = Flask(__name__)
app.secret_key = 'BruceWayneIsBatMan'

@app.route('/register', methods = ['GET', 'POST'])
def contact():
   form = VeriForm()
   
   if request.method == 'POST':
      if form.validate() == False:
         flash('All fields are required.')
         return render_template('register.html', form = form)
      else:
         return render_template('index.html')
      elif request.method == 'GET':
         return render_template('register.html', form = form)

if __name__ == '__main__':
   app.run(debug = True)