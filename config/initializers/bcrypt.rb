if Rails.env.test?
  BCrypt::Engine.cost = BCrypt::Engine::MIN_COST
end
