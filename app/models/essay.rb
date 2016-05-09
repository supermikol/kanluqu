class Essay < ActiveRecord::Base
  has_many :favorites, as: :favoritable
  belongs_to :application
  belongs_to :prompt
end
