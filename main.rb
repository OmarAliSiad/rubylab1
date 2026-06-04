require_relative 'event'
require_relative 'event_router'

require_relative 'console_handler'
require_relative 'file_handler'
require_relative 'stats_handler'

router = EventRouter.new

router.register(ConsoleHandler.new)
router.register(FileHandler.new)
router.register(StatsHandler.new)

loop do
  puts
  puts "=== LifeTrack ==="
  puts "1. Log a work session"
  puts "2. Log a study session"
  puts "3. Log an exercise session"
  puts "4. Log a meal"
  puts "5. Exit"

  print "Choose an option: "

  choice = gets.chomp.to_i

  break if choice == 5

  type =
    case choice
    when 1 then "work"
    when 2 then "study"
    when 3 then "exercise"
    when 4 then "meal"
    else
      puts "Invalid option"
      next
    end

  print "Description: "
  description = gets.chomp

  print "Duration (minutes): "
  duration = gets.chomp.to_i

  event = Event.new(type, description, duration)

  router.dispatch(event)
end