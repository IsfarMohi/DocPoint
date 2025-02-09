import time
import random
import pyautogui
import pywhatkit as kit
from flask import Blueprint, request, jsonify

auth_blueprint = Blueprint("auth", __name__)

@auth_blueprint.route('/login', methods=['GET'])
def login():
    try:
        data = request.get_json()
        phone_number = data.get('Phone Number')

        if not phone_number:
            return jsonify({"error": "Phone number is required!"}), 400
        otp = random.randint(1000, 9999)
        kit.sendwhatmsg_instantly(phone_number, str(otp), wait_time=10)
        time.sleep(5)
        pyautogui.press("enter")
        time.sleep(5)
        return jsonify({"message": f"OTP sent to {phone_number}!", "otp": otp})
    except Exception as e:
        return jsonify({"error": "Failed to send message", "details": str(e)}), 500
