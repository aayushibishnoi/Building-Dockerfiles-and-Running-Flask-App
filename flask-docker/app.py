from flask import Flask
import os

app = Flask(__name__)

# Get greeting from environment variable, default to "Hello, World!"
greeting = os.getenv('GREETING', 'Hello, World!')

@app.route('/')
def home():
    return greeting

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
