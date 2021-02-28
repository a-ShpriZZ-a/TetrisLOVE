Cell = {}

function Cell:new(size)
	local obj = {}
		obj.is_closed = false
		obj.size = size;

	function obj:get_coordinates(x,y)
		xpos = x * self.size
		ypos = y * self.size

		return xpos, ypos
	end

	setmetatable(obj, self)
    self.__index = self; return obj
end