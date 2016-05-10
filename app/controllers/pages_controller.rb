class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_admin, only: [:admin_index]

  def index
  end

  def admin_index
  end

  private

end
