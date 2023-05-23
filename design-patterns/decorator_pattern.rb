class Painting
  def process
    puts "blank canvans"
  end
end

class Decorator < Painting
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def process
    @component.process
  end
end

class PaintDecorator < Decorator
  def process
    puts "paint applied#{component.process}"
  end
end

class TextureDecorator < Decorator
  def process
    puts "knockdown texture applied#{component.process}"
  end
end

class GraphiteDecorator < Decorator
  def process
    puts "graphite applied#{component.process}"
  end
end

class EraserDecorator < Decorator
  def process
    puts "erased the surface#{component.process}"
  end
end

def make_painting(component)
  puts component.process
end

make_painting(
  GraphiteDecorator.new(
    EraserDecorator.new(
      GraphiteDecorator.new(
        TextureDecorator.new(
          PaintDecorator.new(
            Painting.new
          )
        )
      )
    )
  )
)
