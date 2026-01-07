class StudySessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_study_session, only: [:update, :pause, :resume, :finish]

  def index
    @study_sessions = current_user.study_sessions.order(created_at: :desc)
    @active_session = current_user.study_sessions.where(end_time: nil).last
  end

  def create
    @study_session = current_user.study_sessions.new(study_session_params)
    @study_session.start_time = Time.current
    
    if @study_session.save
      redirect_to study_sessions_path, notice: "Study session started! Focus."
    else
      redirect_to study_sessions_path, alert: "Could not start session."
    end
  end

  def finish
    @study_session.update(end_time: Time.current)
    # Round up duration
    duration = ((@study_session.end_time - @study_session.start_time) / 60).ceil
    @study_session.update(duration: duration)

    # Update daily stats
    stat = FocusStat.find_or_create_by(user: current_user, date: Date.today)
    stat.total_study_minutes ||= 0 # Ensure not nil
    stat.increment!(:total_study_minutes, duration)
    
    # Calculate Burnout Score
    score = BurnoutCalculatorService.calculate(current_user)
    stat.update(burnout_score: score)

    redirect_to dashboard_path, notice: "Session finished! Great job."
  end

  def pause
    # Placeholder for more complex state management if needed
    redirect_to study_sessions_path
  end

  def resume
    # Placeholder
    redirect_to study_sessions_path
  end

  private

  def set_study_session
    @study_session = current_user.study_sessions.find(params[:id])
  end

  def study_session_params
    params.require(:study_session).permit(:subject)
  end
end
