# Strategy

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
      puts "1. #{ data.sample.upcase }\n"
    end
  end

  class TwiceRoller
    def self.roll(data)
      randomizedData = data.shuffle

      2.times do |n|
        puts "#{n}. #{ randomizedData.pop }\n"
      end
    end
  end

  class ThriceRoller
    def self.roll(data)
      randomizedData = data.shuffle

      3.times do |n|
        puts "#{n}. #{ randomizedData.pop }\n"
      end
    end
  end

  class FullRoller
    def self.roll(data)
      randomizedData = data.shuffle

      data.length.times do |n|
        puts "#{ n + 1 }. #{ randomizedData.pop }\n"
      end
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
RollerInterface.roll(Rollers::FullRoller)