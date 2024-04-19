from flask import Flask, render_template
from flask_restful import Resource, Api, reqparse, abort
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_cors import CORS
from flask_socketio import SocketIO, emit
from sqlalchemy.exc import IntegrityError
import base64
from io import BytesIO
from PIL import Image
from model import LoadModel,GetMoodByImage

app = Flask(__name__)
api = Api(app)
CORS(app)
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:nikini123@localhost/irelax"
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
socketio = SocketIO(app, cors_allowed_origins='*')

# request parser for usermodel registration
user_parser = reqparse.RequestParser()

user_parser.add_argument('username', type=str, help="user name is required", required=True)
user_parser.add_argument('email', type=str, help="email is required", required=True)
user_parser.add_argument('password', type=str, help="password is required", required=True)
user_parser.add_argument('address', type=str, help="address is required", required=True)

# request parser for usermodel login
user_login_parser = reqparse.RequestParser()

user_login_parser.add_argument('username', type=str, help="user name is required", required=True)
user_login_parser.add_argument('password', type=str, help="password is required", required=True)

# user model database
class UserModel(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(80), nullable=False, unique=True)
    email = db.Column(db.String(120), nullable=False, unique=True)
    password = db.Column(db.String(256), nullable=False)
    address = db.Column(db.String(255), nullable=False)

    def __init__(self, username, email, password, address):
        self.username = username
        self.email = email
        self.address = address
        self.password = password

# user login api
class UserLogin(Resource):
    def post(self):
        args = user_login_parser.parse_args()
        user = UserModel.query.filter_by(username=args['username']).first()
        print("validating credentials")
        if user:
            if user and bcrypt.check_password_hash(user.password, args['password']):
                return {"message": "success", "user": user.username}, 200
            abort(400, message="Invalid Creditials")
        else:
            abort(404, message="Login failed")

# user registration and api
class User(Resource):
    def get(self, username, password):
        print("app is running")
        return {"message": "success"}, 200

    def post(self):
        try:
            args = user_parser.parse_args()
            hashed_password = bcrypt.generate_password_hash(args['password']).decode('utf-8')
            new_user = UserModel(username=args['username'], email=args['email'], password=hashed_password,
                                 address=args['address'])
            db.session.add(new_user)
            db.session.commit()
            print(args)
            return {"message": "success"}, 200

        except IntegrityError as e:

            db.session.rollback()
            print(e)
            return {"message": "duplicate key"}, 400

# APIs
api.add_resource(User, '/users')
api.add_resource(UserLogin, '/login')


def decode_base64_image(base64_string):

    image_bytes = base64.b64decode(base64_string)
    # Convert bytes to image
    image = Image.open(BytesIO(image_bytes))
    return image


# Socket.IO events
@socketio.on('connect')
def handle_connect():
    print('Client connected')


@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected')


@socketio.on('message')
def handle_message(data):
    print('Message received:', data)
    emit('response', 'Message received')


@socketio.on('image')
def handle_image(data):

    returned_image = decode_base64_image(data)
    mood = GetMoodByImage(returned_image,classifier=classifier)
    socketio.emit('mood',{'message':mood})
    print('Message received:', mood)


classifier = None

# main program
if __name__ == "__main__":

    with app.app_context():
        db.create_all()

    classifier = LoadModel()
    socketio.run(app, debug=True,allow_unsafe_werkzeug=True)
