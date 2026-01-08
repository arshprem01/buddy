# Create a user
user = User.create!(email: 'student@example.com', password: 'password', password_confirmation: 'password')

# Create some past sessions
3.times do |i|
  start_time = DateTime.now - (i+1).days
  duration = [ 25, 45, 60, 90 ].sample
  end_time = start_time + duration.minutes

  StudySession.create!(
    user: user,
    subject: [ 'Math', 'History', 'Physics', 'Coding' ].sample,
    start_time: start_time,
    end_time: end_time,
    duration: duration
  )

  FocusStat.create!(
    user: user,
    date: start_time.to_date,
    total_study_minutes: duration,
    burnout_score: [ 'Low', 'Low', 'Medium' ].sample
  )
end

puts "Seeds loaded successfully!"
