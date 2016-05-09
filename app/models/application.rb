class Application < ActiveRecord::Base
  has_many :favorites, as: :favoritable
  belongs_to :user
  has_many :essays
  has_many :test_scores
  has_many :extracurriculars
  has_many :prompts, through: :essays, source: :prompt
  has_many :schools, through: :prompts, source: :school
end
