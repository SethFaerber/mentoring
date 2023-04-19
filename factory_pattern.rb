class Table
  def initialize(data, type)
    @data = data
    @type = type
  end

  def describe
    puts "This is a #{@type} table.\nIt's contents are:\n#{@data}\n\n"
  end

  def roll
    raise NotImplementedError, "roll has not been implemented."
  end
end

class D20 < Table
  def roll
    puts "You roll on the table and get #{ @data.sample.upcase }\n\n"
  end
end

class ActionTheme < Table
  def roll
    puts "You roll on the table and get\n"
    puts "Action: #{ @data[:action].sample.upcase }"
    puts "Theme: #{ @data[:theme].sample.upcase }\n\n"
  end
end

class TableFactory
  def self.build(data, type)
    if type == "D20"
      D20.new(data, type)
    elsif type == "ActionTheme"
      ActionTheme.new(data, type)
    end
  end
end


d20Data = %w(bear crow raven frog rabbit deer sparrow squirrel chipmunk 'possum racoon skunk cicada badger turtle wolf fox lynx mouse rat)
actionThemeData = { action: %w(take leave create destroy amaze forsake), theme: %w(destiny past future supply hope secret) }

d20 = TableFactory.build(d20Data, "D20")
actionTheme = TableFactory.build(actionThemeData, "ActionTheme")

d20.describe
d20.roll

actionTheme.describe
actionTheme.roll
