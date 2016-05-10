class School < ActiveRecord::Base
  has_many :rankings
  has_many :prompts
  has_many :essays, through: :prompts
  has_many :admits
  has_many :schools, through: :admits, source: :application

  accepts_nested_attributes_for :rankings, :prompts,
    :allow_destroy => true,
    :reject_if     => :all_blank
end
