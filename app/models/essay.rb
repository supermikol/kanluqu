class Essay < ActiveRecord::Base
  has_many :favorites, as: :favoritable, dependent: :destroy
  belongs_to :application
  belongs_to :prompt
  validates :content, presence: true
end
