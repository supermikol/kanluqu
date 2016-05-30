class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin, except: [:show, :index]

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all.includes(:schools, :test_scores)

  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @essays = @application.essays.includes(:prompt)
    @extracurriculars = @application.extracurriculars
    @test_scores = @application.test_scores
    @sat_scores = @test_scores.where(category: "SAT")
    @sat_subject_scores = @test_scores.where(category: "SAT Subject Test")
    @toefl_scores = @test_scores.where(category: "TOEFL")
    @act_scores = @test_scores.where(category: "ACT")
    @ap_scores = @test_scores.where(category: "AP")
    @ib_scores = @test_scores.where(category: "IB")
    @other_scores = @test_scores.where(category: "Other")
    @schools = @application.schools
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    @application.user_id = current_user.id
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:_destroy, :name, :major, :student_name, :location, :gender, :year, :study_abroad, :note, :zone, test_scores_attributes: [:id, :_destroy, :category, :subject, :score, :date], extracurriculars_attributes: [:id, :_destroy, :name, :category, :position, :description, :start_date, :end_date], admits_attributes: [:id, :_destroy, :school_id, :admitted])
    end

end
