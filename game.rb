require "gosu"
require_relative "player"

class Game < Gosu::Window

	def initialize 
		super(640, 480)
		@background = Gosu::Image.new("background.png")
		@change_x = 0
		@change_y = -960
		@player = Player.new(@change_x, @change_y, 1320, 20)
	end

	def update
		if self.mouse_x > 600 && self.mouse_x < 640 && @change_x > -1280
			@change_x -= 3
		end
		if self.mouse_x < 40 && self.mouse_x > 0 && @change_x < 0 
			@change_x += 3
		end
		if self.mouse_y < 40 && self.mouse_y > 0 && @change_y < 0
			@change_y += 3
		end
		if self.mouse_y > 440 && self.mouse_y < 480 && @change_y > -960 
			@change_y -= 3
		end
		@player.setChange(@change_x, @change_y)
	end

	def draw
		@background.draw(@change_x, @change_y, 0)
		@player.draw
	end

	def needs_cursor?
		true
	end

end

window = Game.new
window.show