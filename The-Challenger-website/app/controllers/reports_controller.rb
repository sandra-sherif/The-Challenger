class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    @challenge = Challenge.find(params[:challenge_id])
    @user = User.find(params[:user_id])
    @report.challenge_id = @challenge.id
    @report.user_id = @user.id
    @report.save
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

  def destroy
  	@report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path, notice:  "The report has been deleted."
  end

  def index
    @reports = Report.all
  end

  private
  def report_params
    params.require(:report).permit(:challenge_id, :user_id, :reason)
  end

end
