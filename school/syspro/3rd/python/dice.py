import random
from flask import Flask

quotes = [
    "The only way to get rid of a temptation is to yield to it.",
    "To love oneself is the beginning of a lifelong romance.",
    "I am so clever that sometimes I don't understand a single word of what I am saying.",
    "The truth is rarely pure and never simple.",
    "Life is far too important a thing ever to talk seriously about.",
]

app = Flask(__name__)

@app.route('/')
def index():
    num = random.randint(0, len(quotes) - 1)
    msg = quotes[num]
    html = f'<h1>{msg}</h1>'
    return html

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8888, debug=True)