class ClassMethod
  class << self
    def print_class_method
      puts "This was printed from within the class method."
    end
  end

  def print_instance_method
    puts "This was printed from within the instance method."
  end
end

# The class method only executes directly from the class
ClassMethod.print_class_method

# The instance method cannot be called directly from the class
ClassMethod.print_instance_method

classMethod = ClassMethod.new

# The class method can not be executed from an instanced object of a class
classMethod.print_class_method

# The instance method can only be called from an instanced object of a class.
ClassMethod.print_instance_method