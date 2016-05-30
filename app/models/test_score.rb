class TestScore < ActiveRecord::Base
  belongs_to :application
  validates :category, :subject, :score, presence: true
end
