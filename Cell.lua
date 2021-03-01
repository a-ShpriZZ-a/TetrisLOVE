Cell = {}

function Cell:new(size, x, y)
	local obj = {}
		obj.is_closed = false
		obj.size = size;

		obj.x = x * size;
		obj.y = y * size;

	setmetatable(obj, self)
    self.__index = self; return obj
end