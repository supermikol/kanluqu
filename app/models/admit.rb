class Admit < ActiveRecord::Base
  belongs_to :school
  belongs_to :application
end
