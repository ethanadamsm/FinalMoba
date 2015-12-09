require "gosu"

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
	end

	def draw
		@image.draw(@x + @change_x, @y + @change_y, 1)
	end

	def update(change_x, change_y)
		setChange(change_x, change_y)
		move
	end

	def setMoveTo(move_x, move_y)
		@move_x = move_x - @change_x
		@move_y = move_y - @change_y
	end

	def move
		puts "#{x}, #{y}, #{@move_x}, #{@move_y}"
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