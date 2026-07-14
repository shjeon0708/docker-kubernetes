from flask import Flask
import redis

app = Flask(__name__)
r = redis.Redis(
  host='redis',
  port=6379)

@app.route('/')
def count():
  n = r.incr('hits')
  return f'방문 {n}회'

app.run(host='0.0.0.0',
        port=5000)
