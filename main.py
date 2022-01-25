import json
import time

def app(environ, start_response):
    try:
        request_body_size = int(environ.get('CONTENT_LENGTH', 0))
    except (ValueError):
        request_body_size = 0
    request_body = environ['wsgi.input'].read(request_body_size)
    data = json.loads(request_body)
    data = json.dumps(data)
    test1 = data.encode('utf-8')
    start_response("200 OK", [
        ("Content-Type", "text/plain"),
        ("Content-Length", str(request_body_size))
    ])
    time.sleep(600)
    return [test1]