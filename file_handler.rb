require_relative 'handler'

class FileHandler < Handler
  def handle(event)
    File.open("events.log", "a") do |file|
      file.puts(
        "[#{event.timestamp.strftime("%Y-%m-%d %H:%M")}] #{event.type.upcase} - #{event.description} (#{event.duration} min)"
      )
    end
  end
end