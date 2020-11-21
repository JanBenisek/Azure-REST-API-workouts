from flask import Flask
import os
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'key: {}, url: {}, flask: {}'.format(os.environ['KEY'],
                                                os.environ['URL'],
                                                os.environ['FLASK_ENV'])


# Start App
if __name__ == '__main__':
    app.run()
