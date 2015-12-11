require "gosu"
require_relative "healthbar"

class Minion

	def initialize(w, h, side, lane, image, type)
		@width = w
		@height = h
		@side = side
		@lane = lane
		@image = image
		@type = type
		@change_x = 0
		@change_y = 0
		@speed_x = -0.81
		@speed_y = 0.58
		@healthbar = Healthbar.new(20)
		if side == "top"
			@x = 1860.0
			@y = 20.0
		elsif side == "bottom"
			@x = 20.0
			@y = 1380.0
		end
	end

	def update(change_x, change_y, player)
		@change_x = change_x
		@change_y = change_y
		move
		battle(player, 1)
		@healthbar.update(@x + change_x, @y + change_y)
	end

	def move
		if @side == "top"
			@x += @speed_x
			@y += @speed_y
		end
	end

	def battle(player, minions)
		if @x - 5 < player.getX + player.getWidth && @x + 45 > player.getX && @y - 5 < player.getY + player.getHeight && @y + 45 > player.getY
			@speed_x = 0
			@speed_y = 0
			@healthbar.changehealth(-0.25)
		else
			@speed_x = -0.81
			@speed_y = 0.58
		end
	end

	def draw
		@image.draw(@x + @change_x, @y + @change_y, 1)
		@healthbar.draw
	end

	def getX
		@x
	end

	def getY
		@y
	end

	def getWidth
		@width
	end

	def getHeight
		@height
	end

	def getHealth
		@healthbar.getHealth
	end

end