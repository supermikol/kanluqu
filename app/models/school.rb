class School < ActiveRecord::Base
  has_many :rankings
  has_many :prompts
  has_many :essays, through: :prompts
end
