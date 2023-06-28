class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    @survey.save!
    redirect_to survey_templates_path(@survey)
  end

  def update
    @survey = Survey.find(params[:id])
    survey.update!(survey_params)
    redirect_to survey_path(@survey)
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  private

  def survey_params
    params.require(:survey).permit( :name, :description, :anonymous, :template_id, :status)
  end

end
