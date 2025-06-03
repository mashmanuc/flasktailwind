#!/usr/bin/env bash
# exit on error
set -e

# Debug info
echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"
echo "Python version: $(python --version)"

# Create necessary directories
echo "Creating static/css directory..."
mkdir -p static/css

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Install Node.js dependencies
echo "Installing Node.js dependencies..."
npm ci --only=production

# Build Tailwind CSS
echo "Building Tailwind CSS..."
npx tailwindcss -i ./src/input.css -o ./static/css/main.css --minify

# Verify the CSS file was created
if [ ! -f "static/css/main.css" ]; then
  echo "Error: main.css was not created!"
  ls -la static/css/
  exit 1
fi

echo "Build completed successfully!"
