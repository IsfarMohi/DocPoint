from flask import Flask, request, jsonify
from flask_cors import CORS
from services.db import *

from services.auth import auth_blueprint # auth.py /mannan

app = Flask(__name__)

app.register_blueprint(auth_blueprint, url_prefix="/auth") # auth.py /manna

CORS(app)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

