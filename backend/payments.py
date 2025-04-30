from flask import Flask, request, jsonify
import razorpay
from flask_cors import CORS


app = Flask(__name__)
CORS(app)

# Replace with your actual Razorpay API credentials
RAZORPAY_KEY_ID = "rzp_test_j31AGvFFIZU2r5"
RAZORPAY_SECRET = "mihR18q8dhTeclVhULfHSj1D"

client = razorpay.Client(auth=(RAZORPAY_KEY_ID, RAZORPAY_SECRET))

@app.route('/create-order', methods=['POST'])
def create_order():
    data = request.get_json()
    amount = data.get('amount')  # Amount in paise (e.g., ₹500 = 50000 paise)

    order_data = {
        "amount": amount,
        "currency": "INR",
        "payment_capture": "1"  # Auto-capture payment
    }

    order = client.order.create(order_data)
    return jsonify(order)

@app.route('/verify-payment', methods=['POST'])
def verify_payment():
    data = request.get_json()
    razorpay_order_id = data['razorpay_order_id']
    razorpay_payment_id = data['razorpay_payment_id']
    razorpay_signature = data['razorpay_signature']

    try:
        client.utility.verify_payment_signature({
            'razorpay_order_id': razorpay_order_id,
            'razorpay_payment_id': razorpay_payment_id,
            'razorpay_signature': razorpay_signature
        })
        return jsonify({"status": "Payment Verified"}), 200
    except:
        return jsonify({"status": "Payment Verification Failed"}), 400

if __name__ == '__main__':
    app.run(debug=True)
