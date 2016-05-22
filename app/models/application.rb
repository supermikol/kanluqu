class Application < ActiveRecord::Base
  has_many :favorites, as: :favoritable, dependent: :destroy
  belongs_to :user
  has_many :essays, dependent: :destroy
  has_many :test_scores, dependent: :destroy
  has_many :extracurriculars, dependent: :destroy
  has_many :completed_prompts, through: :essays, source: :prompt
  has_many :admits, dependent: :destroy
  has_many :schools, through: :admits
  has_many :prompts, through: :schools

  accepts_nested_attributes_for :extracurriculars, :test_scores,
    :allow_destroy => true,
    :reject_if     => :all_blank

  accepts_nested_attributes_for :admits,
    :allow_destroy => true

  validates :student_name, presence: true
end
