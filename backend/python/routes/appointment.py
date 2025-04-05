from flask import Flask, request, jsonify
from supabase import create_client, Client
import os
from flask_cors import CORS
import traceback


# Initialize Flask App
app = Flask(__name__)
CORS(app, resources={r"/": {"origins": ""}})


# Initialize Supabase client
SUPABASE_URL = "https://urbnqbeoplyrkcwkifof.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVyYm5xYmVvcGx5cmtjd2tpZm9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc1NTcxNDcsImV4cCI6MjA1MzEzMzE0N30.A7hoHz2yBQqG4SCoPwBen0UhbqZLJskKn8EIenUgqk0"
supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

@app.route('/appointments', methods=['POST'])
def create_appointment():
    try:
        data = request.json
        branch = data.get('branch')
        specialization = data.get('specialization')
        date = data.get('date')
        time = data.get('time')

        if not branch or not specialization or not date or not time:
            return jsonify({"error": "Missing required fields"}), 400

        # Insert into Supabase
        response = supabase.table('appointments').insert({
            "branch": branch,
            "specialization": specialization,
            "date": date,
            "time": time,
            "status": "booked",
        }).execute()

        print("Supabase Response:", response)

        if "error" in response and response["error"]:
            return jsonify({"error": response["error"]["message"]}), 500

        return jsonify({"message": "Appointment booked successfully!"}), 201

    except Exception as e:
        print("Error:", str(e))
        traceback.print_exc()
        return jsonify({"error": str(e)}), 500
if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0',port=5000)
