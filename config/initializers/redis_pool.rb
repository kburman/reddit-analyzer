REDIS_POOL = ConnectionPool.new(size: 10) { Redis.new(url: ENV['REDIS_URL']) }
