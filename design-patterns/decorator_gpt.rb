# Component interface
class Character
  def description
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def abilities
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete component
class BaseCharacter < Character
  def description
    "Basic Character"
  end

  def abilities
    []
  end
end

# Decorator
class CharacterDecorator < Character
  def initialize(character)
    @character = character
  end

  def description
    @character.description
  end

  def abilities
    @character.abilities
  end
end

# Concrete decorators
class PlayerCharacter < CharacterDecorator
  def description
    @character.description + ", Player Character"
  end
end

class NonPlayerCharacter < CharacterDecorator
  def description
    @character.description + ", Non-Player Character"
  end
end

class Wizard < CharacterDecorator
  def description
    @character.description + ", Wizard"
  end

  def abilities
    @character.abilities + ["Cast spells"]
  end
end

class Thief < CharacterDecorator
  def description
    @character.description + ", Thief"
  end

  def abilities
    @character.abilities + ["Stealth", "Pick locks"]
  end
end

# Usage
character = BaseCharacter.new
pc_wizard = Wizard.new(PlayerCharacter.new(character))
npc_thief = Thief.new(NonPlayerCharacter.new(character))
pc_npc_wizard = Wizard.new(NonPlayerCharacter.new(PlayerCharacter.new(character)))

puts pc_wizard.description
puts "Abilities: #{pc_wizard.abilities.join(', ')}"

puts npc_thief.description
puts "Abilities: #{npc_thief.abilities.join(', ')}"

puts "the incoherent implementation of this design..."
puts pc_npc_wizard.description