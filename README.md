# Building-Dockerfiles-and-Running-Flask-App
A project to learn Dockerfiles, `CMD`, `ENTRYPOINT`, and environment variables with a Flask app.

# Project Structure:
Create the following directory structure:

    flask-docker/
    ├── app.py
    ├── requirements.txt
    ├── Dockerfile
    ├── test_flask_docker.sh
    └── README.md

## Features
- Containerizes a Flask app with a configurable greeting.
- Uses `CMD` and `ENTRYPOINT` for startup behavior.
- Passes environment variables to customize the app.
- Tests container behavior with a script.

## Files
- `app.py`: Flask app with environment variable support.
- `requirements.txt`: Python dependencies.
- `Dockerfile`: Defines the container setup.
- `test_flask_docker.sh`: Tests container behavior.

## Setup
1. Install Docker: `sudo apt install docker.io`.
2. Build the image: `docker build -t flask-app .`.
3. Run with default greeting: `docker run -p 5000:5000 flask-app`.
4. Run with custom greeting: `docker run -p 5000:5000 -e GREETING="Welcome to Docker!" flask-app`.
5. Run tests: `bash test_flask_docker.sh`.

