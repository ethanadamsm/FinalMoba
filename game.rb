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
		@frames = 0
		@back = 0
		@backing = false
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
			if minion.getHealth == 0
				@minions.delete(minion)
			end
		end
		@frames += 1
		if @frames % 200 == 0
			@minions.push(Minion.new(40, 40, "top", 1, Gosu::Image.new("minion.png"), 1))
		end
		if @backing
			@back += 1 
		end
		if @back % 300 == 0 && @back > 0
			@guy.teleport(20, 1320)
			@backing = false
			@back = 0
			@guy.setChange(0, 0)
			@guy.setMoveTo(@guy.getX, @guy.getY)
		end
		if @guy.getX > 0 && @guy.getX + 50 < 150 && @guy.getY + 100 < 1440 && @guy.getY > 1290
			@guy.addHealth(1)
		end 
		puts @back
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
			when Gosu::KbB
				if @move != 0
					puts "reseting"
					@move = 0
				else 
					@backing = true
					@guy.setChange(0, 0)
					@guy.setMoveTo(@guy.getX, @guy.getY)
					puts @guy.getX
				end
			when Gosu::KbSpace
				@change_x = @guy.getX 
				@change_y = @guy.getY 
		end
	end

end

window = Game.new
window.show