from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__, static_url_path='', static_folder='static')

@app.route('/')
def index():
    return render_template('index.html')

# Додатковий роут для обслуговування favicon.ico
@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                             'favicon.ico', mimetype='image/vnd.microsoft.icon')

if __name__ == '__main__':
    app.run(debug=True)
