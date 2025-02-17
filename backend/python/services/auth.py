import time
import random
import pyautogui
import pywhatkit as kit
from flask import Blueprint, request, jsonify

auth_blueprint = Blueprint("auth", __name__)  # Fixed naming issue

# Temporary storage for OTPs
otp_storage = {}

@auth_blueprint.route('/login', methods=['POST'])
def login():
    try:
        data = request.get_json()
        phone_number = data.get('Phone Number')

        if not phone_number:
            return jsonify({"error": "Phone number is required!"}), 400

        otp = random.randint(1000, 9999)  # Generate OTP
        otp_storage[phone_number] = {"otp": otp, "timestamp": time.time()}  # Store OTP

        # Send OTP via WhatsApp
        kit.sendwhatmsg_instantly(phone_number, str(otp), wait_time=10)
        time.sleep(5)
        pyautogui.press("enter")  # Press Enter to send
        time.sleep(5)

        return jsonify({"message": f"OTP sent to {phone_number}!"})  # No OTP in response

    except Exception as e:
        return jsonify({"error": "Failed to send message", "details": str(e)}), 500

@auth_blueprint.route('/verify-otp', methods=['POST'])
def verify_otp():
    try:
        data = request.get_json()
        phone_number = data.get('Phone Number')
        user_otp = data.get('otp')

        if not phone_number or not user_otp:
            return jsonify({"error": "Phone number and OTP are required!"}), 400

        stored_otp_data = otp_storage.get(phone_number)

        if not stored_otp_data:
            return jsonify({"error": "No OTP found for this number. Please request again."}), 400

        if time.time() - stored_otp_data["timestamp"] > 300:
            del otp_storage[phone_number]
            return jsonify({"error": "OTP expired. Please request a new one."}), 400

        if int(user_otp) == stored_otp_data["otp"]:
            del otp_storage[phone_number]
            return jsonify({"message": "OTP verified successfully!"})
        else:
            return jsonify({"error": "Invalid OTP. Please try again."}), 400

    except Exception as e:
        return jsonify({"error": "Verification failed", "details": str(e)}), 500
