import os
from flask import Flask, jsonify, request
from os import sys
from models import DBconn
import json, flask
from app import app

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'MAO NAJUD NI!'

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')