class Application < ActiveRecord::Base
  has_many :favorites, as: :favoritable
  belongs_to :user
  has_many :essays
  has_many :test_scores
  has_many :extracurriculars
  has_many :completed_prompts, through: :essays, source: :prompt
  has_many :admits
  has_many :schools, through: :admits, source: :school
  has_many :prompts, through: :schools

  accepts_nested_attributes_for :extracurriculars, :test_scores,
    :allow_destroy => true,
    :reject_if     => :all_blank


end
