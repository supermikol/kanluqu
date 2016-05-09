class Prompt < ActiveRecord::Base
  belongs_to :school
  has_many :essays
end
