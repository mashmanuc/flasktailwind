#!/usr/bin/env bash
# exit on error
set -o errexit

# Create necessary directories
mkdir -p static/css

# Install Python dependencies
pip install -r requirements.txt

# Install Node.js dependencies
npm install

# Build Tailwind CSS
npx tailwindcss -i ./src/input.css -o ./static/css/main.css --minify

# Set proper permissions
chmod -R 755 static
