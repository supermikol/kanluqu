class Admit < ActiveRecord::Base
  belongs_to :school
  belongs_to :application
  # default_scope {order('school.name')}
end
