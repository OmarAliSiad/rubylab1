require_relative 'handler'

class ConsoleHandler < Handler
  def handle(event)
    puts
    puts "[#{event.timestamp.strftime("%Y-%m-%d %H:%M")}] #{event.type.upcase} — #{event.description} (#{event.duration} min)"
    puts "✓ Event logged."
  end
end