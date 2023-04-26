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

def build_and_call_singleton
  sportsCar = Car.new("Sports Car")

  puts "Start defined? => #{defined?(sportsCar.start)}"
  puts "Zoom defined? => #{defined?(sportsCar.zoom)}"
  yield(sportsCar)
  puts "Zoom defined? => #{defined?(sportsCar.zoom)}"
  sportsCar.zoom
end

build_and_call_singleton do |singleton_method|
  def singleton_method.zoom
    puts "The #{@type} zooms away."
  end
end


# workingCar = Car.new("Working Car")
# brokenCar = Car.new("Broken Car")
#
# puts "\nBefore singleton method definition...\n\n"
#
# workingCar.start
# workingCar.stop
# brokenCar.start
# brokenCar.stop
#
# def brokenCar.start
#   puts "The #{@type} is broken and won't start"
# end
#
# def brokenCar.tow
#   puts "The #{@type} is being towed"
# end
#
# puts "\nAfter singleton method definition...\n\n"
#
# brokenCar.start
# brokenCar.stop
# brokenCar.tow

# ////////////////////
#
# Combine a singleton with yield just to be obnoxious
# def thing
#   yield
# end..

# thing do
# def thing.singleton
# end...

