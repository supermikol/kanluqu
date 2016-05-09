class School < ActiveRecord::Base
  has_many :rankings
  has_many :prompts
  has_many :essays, through: :prompts
  has_and_belongs_to_many :applications
end
