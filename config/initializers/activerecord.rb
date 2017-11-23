require 'active_record'

config = YAML.load_file(File.expand_path('../../database.yml', __FILE__))
env = ENV.fetch('APP_ENV', 'development')
ActiveRecord::Base.establish_connection(config[env])
ActiveRecord::Base.time_zone_aware_attributes = true
