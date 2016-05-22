class Extracurricular < ActiveRecord::Base
  belongs_to :application
  validates :category, :name, presence: true
end
