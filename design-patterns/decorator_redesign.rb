# Abstract class not implemented
class Character
  def description
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def abilities
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def controlled_by
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete classes which create the base object to be decorated
class PlayerCharacter < Character
  def description
    "PC"
  end

  def abilities
    []
  end

  def controlled_by
    "Controlled by a regular player"
  end
end

class NonPlayerCharacter < Character
  def description
    "NPC"
  end

  def abilities
    []
  end

  def controlled_by
    "Controlled by the Game Master"
  end
end

# Abstract Decorator which consumes the base objects behaviors and grants access to instanced decorators
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

  def controlled_by
    @character.controlled_by
  end
end

# Concrete Decorators which wrap the base object and implement the methods.
class Wizard < CharacterDecorator
  def description
    @character.description + " Wizard"
  end

  def abilities
    %w(Fireball Sleep) + @character.abilities
  end
end

class Thief < CharacterDecorator
  def description
    @character.description + " Thief"
  end

  def abilities
    %w(Sneak LockPick) + @character.abilities
  end
end

class Ranger < CharacterDecorator
  def description
    @character.description + " Ranger"
  end

  def abilities
    %w(Track Hunt) + @character.abilities
  end
end

pc = PlayerCharacter.new
npc = NonPlayerCharacter.new

npc_wizard = Wizard.new(npc)
puts npc_wizard.description
puts npc_wizard.controlled_by
puts npc_wizard.abilities

puts "/////////////////////"

pc_ranger_thief = Thief.new(Ranger.new(pc))
puts pc_ranger_thief.description
puts pc_ranger_thief.controlled_by
puts pc_ranger_thief.abilities

puts "/////////////////////"

pc_wizard_wizard = Wizard.new(Wizard.new(pc))
puts pc_wizard_wizard.description
puts pc_wizard_wizard.controlled_by
puts pc_wizard_wizard.abilities

# Impossible to implement a PC wrapped as NPC because those objects do not decorate and object
# Instead, they are the base objects upon which the decorators act.
# pc_npc_wizard = Wizard.new(pc(npc))
# puts pc_npc_wizard.description

