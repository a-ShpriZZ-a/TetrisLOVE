Figure = {}

function Figure:new(type_, x_spawn_position)
	require("Coordinates")
	local obj = {}

	obj.a_positions = {} -- Ablolute cells coordinates.
	obj.r_positions = {} -- Relative cells coordinates.

	-- Paths to active and deactive figure sprites.
	obj.path_to_active = "Resources/Sprites/Blocks/a" .. tostring(type) .. ".png"
	obj.path_to_deactive = "Resources/Sprites/Blocks/d" .. tostring(type) .. ".png"

	if type_ == 0 then -- I figure
		obj.r_positions[0] = {x=0, y=0}
		obj.r_positions[1] = {x=0, y=1}
		obj.r_positions[2] = {x=0, y=2}
		obj.r_positions[3] = {x=0, y=3}
	end

	if type_ == 1 then -- O figure
		obj.r_positions[0] = {x=0, y=0}
		obj.r_positions[1] = {x=1, y=0}
		obj.r_positions[2] = {x=1, y=1}
		obj.r_positions[3] = {x=0, y=1}
	end

	if type_ == 2 then -- J figure
		obj.r_positions[0] = {x=0, y=0}
		obj.r_positions[1] = {x=-1, y=0}
		obj.r_positions[2] = {x=0, y=1}
		obj.r_positions[3] = {x=0, y=2}
	end

	if type_ == 3 then -- L figure
		obj.r_positions[0] = {x=0, y=0}
		obj.r_positions[1] = {x=1, y=0}
		obj.r_positions[2] = {x=0, y=1}
		obj.r_positions[3] = {x=0, y=2}
	end

	if type_ == 4 then -- Z figure
		obj.r_positions[0] = {x=0, y=0}
		obj.r_positions[1] = {x=-1, y=0}
		obj.r_positions[2] = {x=0, y=1}
		obj.r_positions[3] = {x=1, y=1}
	end

	if type_ == 5 then -- S figure
		obj.r_positions[0] = {x=0, y=0}
		obj.r_positions[1] = {x=1, y=0}
		obj.r_positions[2] = {x=0, y=1}
		obj.r_positions[3] = {x=-1, y=1}
	end

	if type_ == 6 then -- T figure
		obj.r_positions[0] = {x=0, y=0}
		obj.r_positions[1] = {x=0, y=1}
		obj.r_positions[2] = {x=-1, y=0}
		obj.r_positions[3] = {x=1, y=0}
	end

	-- Creation an absolute coordinates of figure's cells.
	for i = 0, 3 do
		ax = obj.r_positions[i].x + x_spawn_position
		ay = obj.r_positions[i].y

		obj.a_positions[i] = {x=ax, y=ay}
	end

	setmetatable(obj, self)
    self.__index = self; return obj
end