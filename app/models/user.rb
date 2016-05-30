class User < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
  has_many :applications
  has_many :favorite_applications, through: :favorites, source: :favoritable, source_type: 'Application'
  has_many :favorite_essays, through: :favorites, source: :favoritable, source_type: 'Essay'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


end
