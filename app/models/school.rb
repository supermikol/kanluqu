class School < ActiveRecord::Base
  has_many :rankings, dependent: :destroy
  has_many :prompts
  has_many :essays, through: :prompts
  has_many :admits
  has_many :applications, through: :admits

  accepts_nested_attributes_for :rankings, :prompts,
    :allow_destroy => true,
    :reject_if     => :all_blank

  validates :name, :category, presence: true
  validates :name, uniqueness: true
end
