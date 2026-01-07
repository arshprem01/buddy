class BurnoutCalculatorService
  def self.calculate(user)
    # Simple rule-based calculation for now
    # Can be enhanced with more data
    today_stats = FocusStat.find_by(user: user, date: Date.today)
    return "Low" unless today_stats

    minutes = today_stats.total_study_minutes || 0

    if minutes > 5
      "High"
    elsif minutes > 2
      "Medium"
    else
      "Low"
    end
  end
end
