import logging
from flask import Flask
from flask_cors import CORS
from services.auth import auth_blueprint  # Importing authentication routes

app = Flask(__name__)

# Register authentication blueprint
app.register_blueprint(auth_blueprint, url_prefix="/auth")

CORS(app)  # Enable Cross-Origin Resource Sharing

logging.basicConfig(level=logging.DEBUG)  # Enable detailed logging

if __name__ == '__main__':
    print("Starting Flask server...")  # Ensure output before running
    app.run(debug=True, host='0.0.0.0', port=5000)
