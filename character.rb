require "gosu"
require_relative "healthbar"

class Character

	attr_reader :x, :y, :width, :height, :image, :attack, :defense, :range, :speed

	def initialize(x, y, width, height, image, attack, health, range, speed)
		@x = x
		@y = y
		@width = width
		@height = height
		@image = image
		@attack = attack
		@health = health
		@range = range
		@speed = speed
		@change_x = 0
		@change_y = 0
		@move_x = x
		@move_y = y
		@healthbar = Healthbar.new(health)
	end

	def draw
		@image.draw(@x + @change_x, @y + @change_y, 1)
		@healthbar.draw
	end

	def update(change_x, change_y, players, minions)
		setChange(change_x, change_y)
		move
		battle(players, minions)
		@healthbar.update(@x - 10 + @change_x, @y - 30 + @change_y)
	end

	def setMoveTo(move_x, move_y)
		@move_x = move_x - @change_x
		@move_y = move_y - @change_y
	end

	def move
		if @x < @move_x
			@x += speed
		end
		if @x > @move_x
			@x -= speed
		end
		if @y < @move_y
			@y += speed
		end
		if @y > @move_y
			@y -= speed
		end
	end	


	def setChange(change_x, change_y)
		@change_x = change_x
		@change_y = change_y
	end

	def battle(players, minions)
		minions.each do |minion|
			if minion.getX - 5 < @x + @width && minion.getX + 45 > @x && minion.getY - 5 < @y + @height && minion.getY + 45 > @y
				if @healthbar.getHealth > 0
					@healthbar.changehealth(-0.25)
				end
			end
		end
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

end