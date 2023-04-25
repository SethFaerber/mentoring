# A benefit of Factory Pattern is that new objects can have shared methods from their parent class
# which are overwritten for custom implementations while also defining their own methods which appear
# only in themselves.

# Here, all objects share the `describe` method without changing it.
# They share `result` method but have custom implementations.
# D20Table implements `rollD20` which is unique to itself.
# ActionThemeTable implements `rollAction` and `rollTheme` which are unique to itself.

class Table
  def initialize(data, type)
    @data = data
    @type = type
  end

  def self.build(data, type)
    if type == "D20"
      D20Table.new(data, type)
    elsif type == "ActionTheme"
      ActionThemeTable.new(data, type)
    end
  end

  def describe
    puts "This is a #{@type} table.\nIt's contents are:\n#{@data}\n\n"
  end

  def result
    raise NotImplementedError, "roll has not been implemented."
  end
end

class D20Table < Table
  def result
    puts "You roll on the table and get #{ rollD20 }\n\n"
  end

  def rollD20
    @data.sample.upcase
  end
end

class ActionThemeTable < Table
  def result
    puts "You roll on the table and get\n"
    puts "Action: #{ rollAction }"
    puts "Theme: #{ rollTheme }\n\n"
  end

  def rollAction
    @data[:action].sample.upcase
  end

  def rollTheme
    @data[:theme].sample.upcase
  end
end


d20Data = %w(bear crow raven frog rabbit deer sparrow squirrel chipmunk 'possum racoon skunk cicada badger turtle wolf fox lynx mouse rat)
actionThemeData = { action: %w(take leave create destroy amaze forsake), theme: %w(destiny past future supply hope secret) }

d20 = Table.build(d20Data, "D20")
actionTheme = Table.build(actionThemeData, "ActionTheme")

d20.describe
d20.result

actionTheme.describe
actionTheme.result
