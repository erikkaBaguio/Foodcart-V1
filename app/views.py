import os
from flask import Flask, jsonify, request
from os import sys
from models import DBconn
import json, flask
from app import app
from spcalls import SPcalls

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'MAO NAJUD NI!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')


spcalls = SPcalls()


@app.route('/api/foodcart/user/signup/', methods = ['POST'])
def store_user():
	data = json.loads(request.data)

	if invalid(jsn['email']):
		return jsonify({'status': 'error', 'message': 'Error'})

	res = spcalls.spcall("store_user", (
			data['fname'],
			data['mname'],
			data['lname'],
			data['address'],
			data['email'],
			data['mobile_number'],
			data['password'],
			data['role_id'],
			data['earned_points']
	))

	if 'Error' in res[0][0]:
		return jsonify({'status': 'error', 'message': res[0][0]})

	else:
		return jsonify({'status': 'ok', 'message': res[0][0]})
