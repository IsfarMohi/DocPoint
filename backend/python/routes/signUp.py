from flask import Flask, request, jsonify
from flask_cors import CORS
from services.db import *

#from services.auth import auth_blueprint # auth.py /mannan

app = Flask(__name__)

#app.register_blueprint(auth_blueprint, url_prefix="/auth") # auth.py /manna

CORS(app)

@app.route('/save_user', methods=['POST','GET'])
def save_user():
    try:
        data = request.get_json()
        if not data:
            return jsonify({'error': 'No input data provided'}), 400

        mobile = data.get('mobile')
        if not mobile:
            return jsonify({'error': 'mobile is required'}), 400

        add_mobile(mobile)

        return jsonify({'message': 'User saved successfully'}), 200
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

