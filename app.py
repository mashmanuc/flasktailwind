from flask import Flask, render_template, send_from_directory, url_for
import os

app = Flask(__name__)

# Configure static file serving
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0  # Disable caching for development

@app.route('/')
def index():
    return render_template('index.html')

# Serve static files with proper caching headers
@app.route('/static/<path:path>')
def serve_static(path):
    return send_from_directory('static', path)

# Serve favicon
@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                             'favicon.ico', mimetype='image/vnd.microsoft.icon')

if __name__ == '__main__':
    app.run(debug=True)
