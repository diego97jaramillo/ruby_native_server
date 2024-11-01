require "active_record"
require_relative "../config/database"

# Create the database if it doesn't exist
unless ActiveRecord::Base.connection.table_exists?(:reports)
  ActiveRecord::Schema.define do
    create_table :reports do |t|
      t.string :name
      t.string :state
      t.timestamps
    end
  end
end
