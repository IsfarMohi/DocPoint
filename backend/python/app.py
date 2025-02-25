from flask import Flask
from flask_cors import CORS
from services.auth import auth_blueprint  # Adjust the import path as needed

app = Flask(__name__)
app.register_blueprint(auth_blueprint, url_prefix="/")
CORS(app)

if __name__ == '__main__':
    print("Starting Flask server...")
    app.run(debug=True, host='0.0.0.0', port=5000)
