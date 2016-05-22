class TestScore < ActiveRecord::Base
  belongs_to :application
  validates :category, :subject, :score, presence: true
  validates :subject, uniqueness: { scope: :category, message: "Please report only the highest score for a single subject."}
end
