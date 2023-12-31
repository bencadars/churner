class UsersController < ApplicationController
  def index
    @users = User.all
    @survey = Survey.find(params[:survey_id])
    @survey_users = @survey.users

    if params[:filter]
      if params[:filter][:type_of_departure].present?
        @users = @users.where(type_of_departure: params[:filter][:type_of_departure])
      end
    end
    if params[:query].present?
     @users = @users.search_by_first_name_and_last_name(params[:query])
    end
  end

  def all_users
    @users = User.all
    if params[:filter]
      if params[:filter][:type_of_departure].present?
        @users = @users.where(type_of_departure: params[:filter][:type_of_departure])
      end
    end
    if params[:query].present?
     @users = @users.search_by_first_name_and_last_name(params[:query])
    end
  end
end
