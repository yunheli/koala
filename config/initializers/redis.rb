# encoding: utf-8

require 'redis'
require 'redis-namespace'
require 'redis/objects'

$redis = Redis.new(host: Figaro.env.redis_host, port: Figaro.env.redis_port)

$koala = Redis::Namespace.new(:koala,   redis: $redis)