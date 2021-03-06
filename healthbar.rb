require "gosu"

class Healthbar

	def initialize(health)
		@starthealth = health
		@health = health
		@image = Gosu::Image.new("healthbar.png")
		@x = 0
		@y = 0
	end

	def draw
		scale = @health / @starthealth 
		@image.draw(@x - 5, @y - 30, 1, scale)
	end

	def changehealth(change)
		if @health > 0 && @health <= @starthealth
			@health += change
		end
		if @health > @starthealth
			@health = @starthealth
		end
	end

	def update(x, y)
		@x = x
		@y = y
	end

	def getHealth
		@health
	end

end