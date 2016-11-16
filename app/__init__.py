from flask import Flask
import os

app = Flask(__name__)
app.debug = True

# if __name__ == '__main__':
#     app.run(debug=True,host='0.0.0.0')

from app import views
