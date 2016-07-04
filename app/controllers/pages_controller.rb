class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new_guest_session]
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
    @new_users = Array.new(10){User.new}

  end

  def create_users
    users = Array.new
    params[:users].each do |user_params|
      unless user_params[:email].blank?
        users << User.new(user_params.permit(:full_name, :email, :password, :password_confirmation, :admin))
      end
    end

    respond_to do |format|
      if users.all? {|usr| usr.valid?}
        users.each {|usr| usr.save}
        format.html { redirect_to users_index_path, notice: 'Application was successfully updated.' }
        format.json { render :users_index, status: :ok }
      else
        @errors = Array.new
        @new_users = Array.new(10){User.new}
        users.each_with_index do |usr,i|
          unless usr.valid?
            @errors << [i, usr.errors.full_messages[0]]
          end
          @new_users[i] = usr
        end
        p @errors
        format.html { render :new_users }
        format.json { render json: new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_users
  end

  def update_users
  end

  def new_guest_session
    sign_in(:user, User.find_by(email: "guest@guest.com"))
    redirect_to '/applications#index'
  end
  private

end
