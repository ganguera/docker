from bottle import route, run, template
from redis import Redis

redis = Redis(host='redis.service.consul', port=6379)

@route('/')
def index():
  redis.incr('hits')
  return template('<b>Hello World! I have been seen {{times}} times.</b>', times=redis.get('hits'))

run(host='0.0.0.0', port=5000)
