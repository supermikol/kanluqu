class Prompt < ActiveRecord::Base
  belongs_to :school
  has_many :essays
  def prompt_with_school
    "(#{school.name})#{content}"
  end
end
