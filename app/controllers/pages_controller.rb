class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_admin, only: [:admin_index]

  def index
    @applications = Application.all
    @ucla = School.find_by(name: "UCLA")
    @stanford = School.find_by(name: "Stanford")
    @usc = School.find_by(name: "University of Southern California")
    @mit = School.find_by(name: "MIT")
    @ucb = School.find_by(name: "UC Berkeley")
  end

  def admin_index
  end

  private

end
