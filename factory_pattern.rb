class Table
  if table_type == "action_theme"
    ActionThemeTable.new
  elsif table_type == "d66"
    D66Table.new
  else
    StraightTable.new
  end
end

class ActionThemeTable < Table

end

class D66Table < Table
  def initialize(table_hash)
    @table_hash = table_hash
  end

  def roll
    d6_table = @table_hash[rand(1..6)]
    result = d6_table[rand(1..6)]
    result
  end
end