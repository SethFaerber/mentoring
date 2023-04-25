# Strategy pattern is used to create unique methods or algorithms which act on an encapsulated data set.
# The idea is that the main class's data is open for use but closed for modification.
# This allows new classes to be written which handle the same source of data in very different ways.
# The benefit of this over factory, is that the main class needs no modification. You simply write a new strategy class and pass it to the main class.
# The drawback is ... not sure.

module TableRollers
  class D20TableRoller
    def self.roll(data)
      puts "You roll on the table and get #{ data.sample.upcase }\n\n"
    end
  end

  class ActionThemeTableRoller
    def self.roll(data)
      puts "You roll on the table and get\n"
      puts "Action: #{ data[:action].sample.upcase }"
      puts "Theme: #{ data[:theme].sample.upcase }\n\n"
    end
  end
end

class Oracle
  #data_set
  def self.roll(data, tableRoller)
    tableRoller.roll(data)
  end
end

d20Data = %w(bear crow raven frog rabbit deer sparrow squirrel chipmunk 'possum racoon skunk cicada badger turtle wolf fox lynx mouse rat)
actionThemeData = { action: %w(take leave create destroy amaze forsake), theme: %w(destiny past future supply hope secret) }

Oracle.roll(d20Data, TableRollers::D20TableRoller)
puts "\n"
Oracle.roll(actionThemeData, TableRollers::ActionThemeTableRoller)

# =================================================================

module Rollers
  class OnceRoller
    def self.roll(data)
      puts "1. #{ data.sample.upcase }\n\n"
    end
  end

  class TwiceRoller
    def self.roll(data)
      randomizedData = data.shuffle

      2.times do |n|
        puts "#{ n + 1 }. #{ randomizedData.pop.upcase }\n"
      end

      puts "\n"
    end
  end

  class ThriceRoller
    def self.roll(data)
      randomizedData = data.shuffle

      3.times do |n|
        puts "#{ n + 1 }. #{ randomizedData.pop.upcase }\n"
      end

      puts "\n"
    end
  end

  class FullRoller
    def self.roll(data)
      randomizedData = data.shuffle

      data.length.times do |n|
        puts "#{ n + 1 }. #{ randomizedData.pop.upcase }\n"
      end

      puts "\n"
    end
  end
end

class RollerInterface
  @data = %w(bear crow raven frog rabbit deer sparrow squirrel chipmunk 'possum racoon skunk cicada badger turtle wolf fox lynx mouse rat)

  def self.roll(timesRoller)
    timesRoller.roll(data = @data)
  end
end

RollerInterface.roll(Rollers::OnceRoller)
RollerInterface.roll(Rollers::TwiceRoller)
RollerInterface.roll(Rollers::ThriceRoller)
RollerInterface.roll(Rollers::FullRoller)