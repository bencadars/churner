class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])
    @template = @survey.template
  end

  def index
    @surveys = Survey.all

    if params[:filter]
      if params[:filter][:status].present?
        @surveys = @surveys.where(status: params[:filter][:status])
      end
    end
    if params[:query].present?
      @surveys = @surveys.search_by_name_and_status_and_description(params[:query])
    end

    @count_receiver_who_answered_survey = Receiver.joins(:answers).where("receivers.created_at >= ?", 30.days.ago).distinct.count

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
    redirect_to survey_templates_path(@survey, anchor: "bottom"), notice: "Template added"
  end

  def archive
    if params[:selected_survey_ids].nil?
      redirect_to surveys_path
    else
      survey_ids = params[:selected_survey_ids].map(&:to_i)

      survey_ids.each do |survey_id|
        survey = Survey.find(survey_id)
        survey.status = "archived"
        survey.save
      end
      flash[:notice] = "#{survey_ids.count} surveys archived"
      redirect_to surveys_path
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def add_question
    @survey = Survey.find(params[:id])
    @question = @survey.questions.create()
    redirect_to survey_templates_path(@survey, anchor: "bottom"), notice: "Question added"
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
