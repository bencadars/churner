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
    @survey.save
    redirect_to survey_templates_path(@survey)
    flash[:notice] = "#{@survey.name} created"
  end

  def update
    @survey = Survey.find(params[:id])
    @survey.update!(survey_params)
    redirect_to survey_users_path(@survey)
  end

  def edit
    @survey = Survey.find(params[:id])
  end

def add_receivers
# récupérer dans les params la liste des users
  @survey = Survey.find(params[:id])
  users = params[:selected_user_ids].map(&:to_i)
# pour chaque user, créer une instance de receiver
# besoin de l'id du user et de l'id d'un survey
  users.each do |user|
    Receiver.create(survey_id: params[:id], user_id: user)
  end
 # faire un flash avec un redirect
  flash[:notice] = "#{users.count} employees added to your survey"
  redirect_to survey_users_path(params[:id])
end

  private

  def survey_params
    params.require(:survey).permit( :name, :description, :anonymous, :template_id, :status)
  end

end
