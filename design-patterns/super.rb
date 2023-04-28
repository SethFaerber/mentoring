# super keyword calls the method in which it is declared from a parent class or higher.
# Here, child.scold is called, puts the message, then super calls scold again but from parent.scold.

class Parent
  def scold
    puts "You're in trouble, young man."
  end
end

class Child < Parent
  def scold
    puts "I'm a child and I'm sad because my parent said:"
    super
  end
end

Child.new.scold