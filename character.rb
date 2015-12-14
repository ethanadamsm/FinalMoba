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
		@mousex = 0
		@mousey = 0
		@red = false
		@green = false
		@greenimage = Gosu::Image.new("green.png")
		@redimage = Gosu::Image.new("red.png")
	end

	def draw
		@image.draw(@x + @change_x, @y + @change_y, 1)
		@healthbar.draw
		if @green
			@greenimage.draw(@x - ((@range - @width) / 2), @y - ((@range - @width) / 2), 1, @range / 100, @range / 100)
		elsif @red
			@redimage.draw(@x - ((@range - @width) / 2), @y - ((@range - @width) / 2), 1, @range / 100, @range / 100)
		end
	end

	def update(change_x, change_y, players, minions, mousex, mousey)
		setChange(change_x, change_y)
		move
		battle(players, minions)
		@healthbar.update(@x - 10 + @change_x, @y - 30 + @change_y)
		minions.each do |minion|
			if minion.mouseCollide(mousex, mousex)
				puts "collide"
				if @x - ((@range - @width) / 2) < minion.getX - 40 && @x + @width + ((@range - width) / 2) && @y - ((@range - @height) / 2) < minion.getY + 40 && @y + @height + ((@range + @height) / 2) > minion.getY
					@green = true
					puts "green"
				else
					@red = true
					puts "red"
				end
			else
				@red = false
				@green = false
			end
		end
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
			if minion.getX - 30 < @x + @width && minion.getX + 70 > @x && minion.getY - 30 < @y + @height && minion.getY + 70 > @y
				if @healthbar.getHealth > 0
					@healthbar.changehealth(-0.05)
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

	def teleport(x, y)
		@x = x
		@y = y
	end

	def addHealth(value)
		@healthbar.changehealth(value)
	end

end