from flask import Flask, request, jsonify

app = Flask(__name__)

# Dummy user data storage (replace with a database)
users = []


@app.route('/register', methods=['POST'])
def register():
    data = request.json
    username = data['username']
    password = data['password']

    # In a real application, you would hash and salt the password before storing it.

    users.append({'username': username, 'password': password})
    return jsonify({'message': 'User registered successfully'})


@app.route('/login', methods=['POST'])
def login():
    data = request.json
    username = data['username']
    password = data['password']

    user = next((user for user in users if user['username'] == username and user['password'] == password), None)

    if user:
        return jsonify({'message': 'Login successful'})
    else:
        return jsonify({'message': 'Invalid credentials'})


if __name__ == '__main__':
    app.run()
