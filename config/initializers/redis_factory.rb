class RedisFactory
  def self.create
    Thread.current[:redis] ||= Redis.new(url: ENV.fetch("REDIS_URL","redis://localhost:6379"))
  end
end
