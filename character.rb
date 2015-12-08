require "gosu"

class Character

	attr_reader :x, :y, :width, :height, :image, :attack, :defense, :range, :speed

	def initialize(x, y, width, height, image, attack, defense, range, speed)
		@x = x
		@y = y
		@width = width
		@height = height
		@image = image
		@attack = attack
		@defense = defense
		@range = range
		@speed = speed
		@change_x = 0
		@change_y = 0
		@move_x = 0
		@move_y = 0
	end

	def draw
		@image.draw(@x + @change_x, @y + @change_y, 1)
	end

	def update(change_x, change_y)
		setChange(change_x, change_y)
		move
	end

	def setMoveTo(move_x, move_y)
		@move_x = move_x
		@move_y = move_y
	end

	def move
		if @move_x > @x 
			@x += speed
		end
		if @move_x < @x 
			@x -= speed
		end
		if @move_y > @y 
			@y += speed
		end
		if @move_y > @y
			@y -= speed
		end
		if @move_x < @x + speed || @move_x > @x - speed
			@move_x = 0
		end
		if @move_y < @y + speed || @move_y > @y - speed
			@move_y = 0
		end
	end	

	def setChange(change_x, change_y)
		@change_x = change_x
		@change_y = change_y
		puts @x + @change_x
		puts @y + @change_y
	end

end