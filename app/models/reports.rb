require 'active_record'

class Report < ActiveRecord::Base

  VALID_STATES = ['disponible', 'no_hay', 'dañado']
  # Add validations or custom methods if needed
  validates :name, presence: true
  validates :state, presence: true, inclusion: { in: VALID_STATES, message: "No es una estado valido para reportarlo."}
end
