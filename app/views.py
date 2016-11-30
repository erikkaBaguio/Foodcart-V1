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


@app.route('/api/foodcart/users/signup/', methods = ['POST'])
def store_user():
	data = json.loads(request.data)

	if invalid(jsn['email']):
		return jsonify({'status': 'error', 'message': 'Error'})

	user = spcalls.spcall("store_user", (
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
		return jsonify({'status': 'error', 'message': user[0][0]})

	else:
		return jsonify({'status': 'ok', 'message': user[0][0]})


@app.route('/api/foodcart/users/', methods = ['GET'])
def get_users():
	user = spcalls.spcall('get_user', ())

	if 'Error' in str(user[0][0]):
		return jsonify({'status': 'error', 'message': user[0][0]})

	entries = []
	for r in user:
		entries.append({'id': str(r[0]), 'fname': str(r[1]), 'mname': str(r[2]), 'lname': str(r[3]), 'address': str(r[4]), 
						'email': str(r[5]), 'mobile_number': str(r[6]), 'role_id': str(r[8]), 'earned_points': str(r[9])})

	return jsonify({'status': 'ok', 'entries': entries, 'count': len(entries)})
