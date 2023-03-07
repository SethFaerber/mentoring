class Car
  def initialize(type)
    @type = type
  end

  def start
    puts "The #{@type} starts"
  end

  def stop
    puts "The #{@type} stops"
  end
end

workingCar = Car.new("Working Car")
brokenCar = Car.new("Broken Car")

puts "\nBefore singleton method definition...\n\n"

workingCar.start
workingCar.stop
brokenCar.start
brokenCar.stop

def brokenCar.start
  puts "The #{@type} is broken and won't start"
end

def brokenCar.tow
  puts "The #{@type} is being towed"
end

puts "\nAfter singleton method definition...\n\n"

brokenCar.start
brokenCar.stop
brokenCar.tow