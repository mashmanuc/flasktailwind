#!/usr/bin/env bash
# exit on error
set -o errexit

# Build commands for front end to create the production build
rm -rf public
npm install && npm run build
pip install -r requirements.txt

# Initialize/clear the "static" folder
mkdir -p static/css

# Copy the built CSS file to the static folder
cp src/output.css static/css/main.css
