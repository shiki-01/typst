import os, time, json
from flask import Flask, request, redirect
from markupsafe import Markup

SAVE_FILE = os.path.join(os.path.dirname(__file__), 'chat_log.json')

app = Flask(__name__)

@app.route('/')
def index():
    logs = ""
    for c in reversed(read_chat_log()):
        name, body = Markup(c["name"]), Markup(c["body"])
        logs += f'<div class=`box`><span class=`name`>{name}</span></div>'
        logs += f'{body}<span class=`date`>{c["date"]}</span></div>'
    css = """
        h1 { background-color: #eef; color: black; padding: 1em; }
        .blue { background-color: #eef; }
        .box { border-bottom: 1px solid gray; padding: 1em; margin: 1em; }
        .name { font-weight: bold; color: blue; background-color: #ff3; }
        .date { font-size: 0.8em; color: gray; }
    """
    form = """
        <form action="/write">
            名前：<input type="text" name="name" placeholder="Name" size="8">
            内容：<input type="text" name="body" placeholder="Message" size="30">
            <input type="submit" value="発言">
        </form>
    """
    return f"""
        <!DOCTYPE html>
        <html><meta charset=`utf-8`><title>Chat</title><style>{css}</style>
        <body><h1>チャット</h1><div class="box blue">{form}<div>{logs}</body></html>
    """

@app.route('/write')
def write():
    name = request.args.get('name', '')
    body = request.args.get('body', '')
    if name is None or name == '' or body is None or body == '':
        return redirect('/')
    try:
        chats = read_chat_log()
        chats.append({"name": name, "body": body, "date": time.strftime("%Y-%m-%d %H:%M:%S")})
        with open(SAVE_FILE, 'w', encoding="utf-8") as f:
            json.dump(chats, f)
    except Exception as e:
        print('Error:', e)
    return redirect('/')

def read_chat_log():
    try:
        with open(SAVE_FILE, 'r', encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        print('Error:', e)
        return []
    
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8888, debug=True)