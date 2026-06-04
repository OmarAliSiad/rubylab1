require_relative 'handler'

class StatsHandler < Handler
  def initialize
    @count = 0
    @total_minutes = 0

    at_exit do
      puts
      puts "===== Statistics ====="
      puts "Events logged : #{@count}"
      puts "Total minutes : #{@total_minutes}"
      puts "======================"
    end
  end

  def handle(event)
    @count += 1
    @total_minutes += event.duration
  end
end