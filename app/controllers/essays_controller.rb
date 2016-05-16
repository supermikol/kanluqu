require 'net/http'
require 'json'

class EssaysController < ApplicationController
  before_action :set_essay, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin, except: [:show, :index]
  def index
    @application = Application.find(params[:application_id])
    @essays = @application.essays.all
  end

  def show

  end

  def new
    @application = Application.find(params[:application_id])
    @essay = Essay.new
  end

  def edit
    @application = @essay.application
  end

  def create
    @essay = Essay.new(essay_params)
    essay = essay_params[:content]
    url = "https://api.havenondemand.com/1/api/sync/analyzesentiment/v1?text=" + essay + "&apikey=" + API_KEYS['haven_on_demand']['api']
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    essay.sentiment = json_response['aggregate']['score']


    @essay.application_id = params[:application_id]
    respond_to do |format|
      if @essay.save
        format.html { redirect_to @essay, notice: 'Essay was successfully created.' }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essays/1
  # PATCH/PUT /essays/1.json
  def update
    respond_to do |format|
      if @essay.update(essay_params)
        format.html { redirect_to @essay, notice: 'Essay was successfully updated.' }
        format.json { render :show, status: :ok, location: @essay }
      else
        format.html { render :edit }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essays/1
  # DELETE /essays/1.json
  def destroy
    application = @essay.application
    @essay.destroy
    respond_to do |format|
      format.html { redirect_to application_essays_url(application), notice: 'Essay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay
      @essay = Essay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def essay_params
      params.require(:essay).permit(:application_id, :prompt_id, :category, :content, :title)
    end
end
