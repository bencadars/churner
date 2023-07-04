require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    if user_signed_in? && !session[:welcome_message_displayed]
      @welcome_message = "Welcome back #{current_user.first_name}! It's great to see you again!"
      session[:welcome_message_displayed] = true
    end

    def last_12_months
      today = Date.today.prev_month.beginning_of_month
      months = []
      12.times do |n|
        months.unshift(today.prev_month(n))
      end
      months
    end

    months_array = last_12_months
    @departure = []
    @result = {}
    months_array.each do |month|
      start_date = month
      end_date = start_date.end_of_month
      @departure << User.where(date_of_departure: start_date..end_date).group(:type_of_departure).count
      users_count_by_departure_type_per_month = User.where("DATE_TRUNC('month', date_of_departure) = ?", month).group(:type_of_departure).count
    end
    @months_array = months_array.map { |month| month.strftime('%B %Y') }
    @departure = @departure.to_json

    start_of_month = Time.zone.now.beginning_of_month
    end_of_month = Time.zone.now.end_of_month
    @count_survey_on_last_30_days = Survey.where("created_at >= ?", 30.days.ago).count
    @count_receiver_on_last_30_days = Receiver.where("created_at >= ?", 30.days.ago).count
    @count_receiver_who_answered_last_30_days = Receiver.joins(:answers).where("receivers.created_at >= ?", 30.days.ago).distinct.count
    @count_receiver_who_answered = Receiver.joins(:answers).distinct.count

  end
end
