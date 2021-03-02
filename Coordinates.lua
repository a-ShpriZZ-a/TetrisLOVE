Coordinates = {}

function Coordinates:new(x, y)
	local obj = {}
		obj.x = x;
		obj.y = y;

	setmetatable(obj, self)
    self.__index = self; return obj
end