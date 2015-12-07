require "gosu"
require_relative "charcter"

class Guy < Character

	def initialize(x, y)
		@change_x = 0
		@change_y = 0
		super(x, y, 50, 50, Gosu::Image.new("guy.png"), 50, 100, 10, 350)
	end

	def draw
		super.image.draw(@x + @change_x, @y + @change_y)
	end

	def setChange(change_x, change_y)
		@change_x = change_x
		@change_y = change_y
	end

end