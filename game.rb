require "gosu"
require_relative "character"
require_relative "minion"
class Game < Gosu::Window

	def initialize 
		super(640, 480)
		@background = Gosu::Image.new("background.png")
		@change_x = 0
		@change_y = -960
		@minions = []
		@guy = Character.new(20, 1320, 100, 50, Gosu::Image.new("guy.png"), 50, 100, 10, 3)
		@minions.push(Minion.new(40, 40, "top", 1, Gosu::Image.new("minion.png"), 1))
	end

	def update
		if self.mouse_x > 600 && self.mouse_x < 640 && @change_x > -1280
			@change_x -= 7
		end
		if self.mouse_x < 40 && self.mouse_x > 0 && @change_x < 0 
			@change_x += 7
		end
		if self.mouse_y < 40 && self.mouse_y > 0 && @change_y < 0
			@change_y += 7
		end
		if self.mouse_y > 440 && self.mouse_y < 480 && @change_y > -960 
			@change_y -= 7
		end
		@guy.update(@change_x, @change_y, 1, @minions)
		@minions.each do |minion|
			minion.update(@change_x, @change_y, @guy)
		end
	end

	def draw
		@background.draw(@change_x, @change_y, 0)
		@guy.draw
		@minions.each do |minion|
			minion.draw
		end
	end

	def needs_cursor?
		true
	end

	def button_down(id)
		case id 
			when Gosu::MsRight
				@guy.setMoveTo(self.mouse_x, self.mouse_y)
		end
	end

end

window = Game.new
window.show