class Ranking < ActiveRecord::Base
  belongs_to :school
  validates :school, uniqueness: { scope: :year, message: "Cannot have multiple ranks for a single year."}
end
