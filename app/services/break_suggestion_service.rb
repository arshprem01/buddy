class BreakSuggestionService
  def self.suggest(duration_minutes)
    if duration_minutes >= 90
      { type: "Power nap / Offline activity", duration: 15 }
    elsif duration_minutes >= 40
      { type: "Walk / Breathing exercise", duration: 10 }
    else
      { type: "Stretch / Water break", duration: 5 }
    end
  end
end
