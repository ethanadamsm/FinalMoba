require_relative "guy"

class Player < Guy

	def initialize(change_x, change_y, x, y)
		super(x, y)
	end

	def draw
		drawi
	end

	def setChange(change_x, change_y)
		setchange(change_x, change_y)
	end

end