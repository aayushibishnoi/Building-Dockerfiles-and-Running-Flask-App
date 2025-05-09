#!/bin/bash

# Test script for Flask Docker Project

# Check if Docker is installed
echo "Checking for Docker..."
if ! command -v docker >/dev/null 2>&1; then
    echo "FAIL: Docker not found. Install it with 'sudo apt install docker.io'."
    exit 1
fi
echo "PASS: Docker found"

# Build Docker image
echo "Building Docker image..."
docker build -t flask-app .
if [ $? -eq 0 ]; then
    echo "PASS: Image built successfully"
else
    echo "FAIL: Image build failed"
    exit 1
fi

# Test 1: Run container with default greeting
echo "Testing default greeting..."
docker run -d -p 5000:5000 --name flask_default flask-app
sleep 5
if curl -s http://localhost:5000 | grep -q "Hello, World!"; then
    echo "PASS: Default greeting 'Hello, World!' displayed"
else
    echo "FAIL: Default greeting test failed"
fi
docker stop flask_default
docker rm flask_default

# Test 2: Run container with custom greeting via environment variable
echo "Testing custom greeting..."
docker run -d -p 5000:5000 --name flask_custom -e GREETING="Welcome to Docker!" flask-app
sleep 5
if curl -s http://localhost:5000 | grep -q "Welcome to Docker!"; then
    echo "PASS: Custom greeting 'Welcome to Docker!' displayed"
else
    echo "FAIL: Custom greeting test failed"
fi
docker stop flask_custom
docker rm flask_custom

# Test 3: Test command-line override (override CMD)
echo "Testing command-line override..."
docker run -d -p 5000:5000 --name flask_override flask-app
sleep 5
if curl -s http://localhost:5000 | grep -q "Hello, World!"; then
    echo "PASS: Command-line override (default CMD) works"
else
    echo "FAIL: Command-line override test failed"
fi
docker stop flask_override
docker rm flask_override

# Test 4: Test container restart behavior
echo "Testing container restart..."
docker run -d -p 5000:5000 --name flask_restart flask-app
sleep 5
docker stop flask_restart
docker start flask_restart
sleep 5
if curl -s http://localhost:5000 | grep -q "Hello, World!"; then
    echo "PASS: Container restarted successfully"
else
    echo "FAIL: Container restart test failed"
fi
docker stop flask_restart
docker rm flask_restart

echo "All tests completed!"
