FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Set environment variable (can be overridden)
ENV GREETING="Hello, World!"

EXPOSE 5000

# Use ENTRYPOINT to run the Flask app
ENTRYPOINT ["python", "app.py"]

# CMD provides default arguments (can be overridden)
CMD []
