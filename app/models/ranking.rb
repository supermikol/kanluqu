class Ranking < ActiveRecord::Base
  belongs_to :school
  validates :rank, uniqueness: { scope: :year, message: "Cannot have multiple ranks for a single year."}
end
