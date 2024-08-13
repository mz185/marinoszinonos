import firebase_admin
import functions_framework
from firebase_admin import credentials
from flask import jsonify
from sendgrid.helpers.mail import Mail, ReplyTo
from sendgrid.sendgrid import SendGridAPIClient

from model.sender import Sender

# Initialize the Firebase Admin SDK
cred = credentials.ApplicationDefault()
firebase_admin.initialize_app(cred)


@functions_framework.http
def send_email(request):
    data = request.get_json(silent=True)
    sender = Sender(
        name=data['name'],
        email=data['email'],
        message=data['message']
    )

    if not sender.email:
        return jsonify({"error": "No message provided"}), 400

    if not sender.message:
        return jsonify({"error": "No message provided"}), 400

    # Retrieve the SendGrid API key and the admin email from Firebase environment configuration
    from_email_address = firebase_admin.get_app().options.get('email').get('address')
    sendgrid_api_key = firebase_admin.get_app().options.get('sendgrid').get('key')
    sg = SendGridAPIClient(api_key=sendgrid_api_key)

    email = Mail(
        from_email=from_email_address,
        to_emails='marinoszenonos@gmail.com',
        subject=f'New message from {sender.name if sender.name else "unknown"}',
        plain_text_content=sender.message
    )

    email.reply_to = ReplyTo(email=sender.email)

    try:
        response = sg.send(email)
        return jsonify(
            {"message": "Email sent successfully", "status_code": response.status_code}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
