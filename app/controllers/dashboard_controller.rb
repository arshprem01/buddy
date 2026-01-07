class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @stats = FocusStat.where(user: current_user)
    
    @weekly_study_minutes = @stats.group_by_day(:date, range: 1.week.ago..Date.today).sum(:total_study_minutes)
    
    @today_stat = @stats.find_by(date: Date.today)
    @burnout_score = @today_stat&.burnout_score || "Low"
    
    @recent_sessions = current_user.study_sessions.order(created_at: :desc).limit(5)
    
    @active_session = current_user.study_sessions.where(end_time: nil).last
  end
end
