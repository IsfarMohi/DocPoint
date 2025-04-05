import os 
from dotenv import load_dotenv
from supabase import create_client
from flask import jsonify
import time

load_dotenv()

url = os.getenv('URL')
key = os.getenv('KEY')

supabase = create_client(url, key)

def add_mobile(mobile):
    try:
        response = supabase.table('users').insert({'phone': mobile}).execute()
        print("mobile added/updated successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")

def verify_number(phone_number, stored_otp_data, user_otp, otp_storage):

    if not phone_number or not user_otp:
            return jsonify({"error": "Phone number and OTP are required!"}), 400

    if not stored_otp_data:
        return jsonify({"error": "No OTP found for this number. Please request again."}), 400

    if time.time() - stored_otp_data["timestamp"] > 300:
        del otp_storage[phone_number]
        return jsonify({"error": "OTP expired. Please request a new one."}), 400

    if int(user_otp) == stored_otp_data["otp"]:
        add_mobile(phone_number)
        del otp_storage[phone_number]
        return jsonify({"message": "OTP verified successfully!"})
    else:
        return jsonify({"error": "Invalid OTP. Please try again."}), 400

#check