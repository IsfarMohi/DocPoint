from flask import Flask, request, jsonify
from flask_cors import CORS
from supabase import create_client, Client

app = Flask(__name__)

CORS(app)

# Supabase configuration
SUPABASE_URL = "https://lynonbmmglvpivolqyrw.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx5bm9uYm1tZ2x2cGl2b2xxeXJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzNTU3MTMsImV4cCI6MjA1MDkzMTcxM30.pYR2Aquu9zmWUSPUt5g5nXvoV1DD2Ba8L7Jh7P7XFWQ"  # Replace with your actual Supabase key
supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

@app.route('/save_user', methods=['POST'])
def save_user():
    try:
        # Parse JSON input
        data = request.get_json()
        if not data:
            return jsonify({'error': 'No input data provided'}), 400

        # Extract and validate input fields
        mobile = data.get('mobile')
        if not mobile:
            return jsonify({'error': 'Name and mobile are required'}), 400

        # Insert into Supabase
        response = supabase.table('otpauth').insert({'mobile': mobile}).execute()

        # Check if there was an error during insertion
        if response.get('status_code') and response['status_code'] != 200:
            return jsonify({'error': response.get('message', 'Unknown error')}), 500

        return jsonify({'message': 'User saved successfully'}), 200
    except Exception as e:
        # Log the error for debugging
        print(f"Error: {e}")
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

