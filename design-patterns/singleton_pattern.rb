# Singleton pattern enforces a single instantiation of its object by privatizing the `:new` method.

class SingleLadies
  @@instance = SingleLadies.new

  def self.instance
    @@instance
    puts "All the single ladies"
    puts self.object_id
    hands_up
  end

  def self.hands_up
    puts "'yo hands up"
  end

  private_class_method :new, :hands_up
end

# Though this is instantiated two times, it has the same object_id
SingleLadies.instance
SingleLadies.instance

# =================================================================
# Another way using Ruby's built-in Singleton module

require 'singleton'

class Snowflake
  include Singleton

  def share
    puts "I'm a unique snowflake, cuz my object_id is always #{ self.object_id }"
  end
end

Snowflake.instance.share
Snowflake.instance.share