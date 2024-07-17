if defined?(Rails)
  puts "Rails #{Rails.version} environment loaded."
  puts "You are connected to #{ActiveRecord::Base.connection_db[:database]}."
end

IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => ">> ",
  :PROMPT_S => "%l>> ",
  :PROMPT_C => ".. ",
  :RETURN => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM

if defined?(ActiveRecord)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

def reload!
  puts "Reloading..."
  reload!
  true
end

# Usage: benchmark_query { User.all.to_a }
class Object
  def attrs
    puts self.attributes.map { |k, v| "#{k}: #{v}" }.join("\n")
  end
end

def benchmark_query
  result = nil
  time = Benchmark.measure do
    result = yield
  end
  puts "Time: #{time.real.round(3)} seconds"
  result
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
