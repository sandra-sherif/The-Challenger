class ReportsController < ApplicationController

  # This method is called whenever a user click on report button and it creates a new instance of Report
  # and adds the challenge and user id to the report table then redirects to challenges_path - Amr Nafie
  def create
    @report = Report.new(report_params)
    
    if params[:upload_type] == "Challenge"
      @challenge = Challenge.find(params[:challenge_id])
      @user = User.find(params[:user_id])
      @report.challenge_id = @challenge.id
      @report.user_id = @user.id
      @report.upload_type = "Challenge"
      @report.save
    else
      @response = Response.find(params[:response_id])
      @user = User.find(params[:user_id])
      @report.challenge_id = @response.id
      @report.user_id = @user.id
      @report.upload_type = "Response"
      @report.save
    end
    if @report.save
      redirect_to challenges_path, notice: "The report has been sent."
    else
      render "new"
    end
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
  end

# This method takes a report and removes it from the report table and redirects to reports page - Amr Nafie
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path, notice:  "The report has been deleted."
  end

  def index
    @reports = Report.all
  end

# def report_params provides the parameters needed for the functions - Amr Nafie
  private
  def report_params
    params.require(:report).permit(:challenge_id, :user_id, :reason)
  end

end
