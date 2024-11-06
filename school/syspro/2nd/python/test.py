# encoding : utf-8
# webtest --- 時刻を表示するサービス

from http.server import BaseHTTPRequestHandler, HTTPServer
import datetime

htmlstr1 = '''\
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Webserver test</title>
<style type="text/css">
h1, h2 {border-bottom: solid black 3px;}
</style>
</head>
<body>
<h1>Webserver test</h1>
'''

htmlstr2 = '</body></html>'

class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html; charset=utf-8')
        self.end_headers()
        self.wfile.write(htmlstr1.encode('utf-8'))
        now = datetime.datetime.now().strftime('%H 時 %M 分 %S 秒')
        self.wfile.write(('<p>' + now + '</p>').encode('utf-8'))
        self.wfile.write(htmlstr2.encode('utf-8'))

with HTTPServer(('', 8000), MyHandler) as server:
    server.serve_forever()