#!/usr/bin/env bash
# exit on error
set -o errexit

# Install Python dependencies
pip install -r requirements.txt

# Install Node.js dependencies and build Tailwind CSS
npm install
npm run build

# Ensure the static/css directory exists
mkdir -p static/css
