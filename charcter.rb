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
		@change_x = nil
		@change_y = nil
	end

	def image
		@image
	end

end