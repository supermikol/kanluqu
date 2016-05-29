class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_admin, only: [:users_index, :new_users, :create_users, :edit_users, :update_users]

  def index
    @applications = Application.all
    @ucla = School.find_by(name: "UCLA")
    @stanford = School.find_by(name: "Stanford")
    @usc = School.find_by(name: "University of Southern California")
    @mit = School.find_by(name: "MIT")
    @ucb = School.find_by(name: "UC Berkeley")
  end

  def users_index
    @users = User.all
  end

  def new_users
  end

  def create_users
  end

  def edit_users
  end

  def update_users
  end

  private

end
