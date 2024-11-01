require 'active_record'

# Establish the database connection
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'dpg-csieo8aj1k6c73ascu3g-a.oregon-postgres.render.com',
  port: 5432, # Verifica en Render si es diferente
  username: 'ruby_native_user',
  password: 'MnQvVqeNM2tythEVcKv4ZXpY8wbjVBAP',
  database: 'ruby_native' # the name of your database
)
