require 'active_record'

# Establish the database connection
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',      # or the IP address of your PostgreSQL server
  port: 5435,
  username: 'postgres', # your PostgreSQL username
  password: 'Diego97', # your PostgreSQL password
  database: 'ruby_native'  # the name of your database
)
 