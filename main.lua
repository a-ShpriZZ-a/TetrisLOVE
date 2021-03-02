tick = require("tick") -- Framerate control module.
require("Cell") -- Cell class.
require("Coordinates")
require("Figure")

-- ***SETTINGS*** -- 
local SIZE_CELL = 16   -- Cell size.
local SIZE_WIDTH = 14  -- Field width.
local SIZE_HEIGHT = 28 -- Field height.

local FALL_TIME = 20   -- Frames before falling.


-- ***CONTROL SETTINGS*** --
local LEFT = "a"
local RIGHT = "d"
local TURN = "w"
local DROP = "s"

local FALL_TIME_NOW = FALL_TIME

-- ***FIELDS SETTINGS*** --
local field_size = Coordinates:new(SIZE_WIDTH * SIZE_CELL, SIZE_HEIGHT * SIZE_CELL) --  Field size.
local field_coordinates = Coordinates:new(20, 20) -- The coordinates of the beginning of the field.

-- ***NEXT FIGURE FIELD SETTINGS*** --
local size_next = 6 * SIZE_CELL -- Next figure field size.
local next_field_coordinates = Coordinates:new(field_coordinates.x + field_size.x + 20, field_coordinates.y)

fg = Figure:new(0, 4)

function love.load()
	tick.framerate = 60 -- Lock framerate.

	-- Create array of cells and fill it instances.
	cells = {}
	for  x = 0, SIZE_WIDTH - 1 do
		y_cells = {}
		for y = 0, SIZE_HEIGHT - 1 do
			y_cells[y] = Cell:new(SIZE_CELL, x, y)
		end
		cells[x] = y_cells
	end

	a0 = love.graphics.newImage("Resources/Sprites/Blocks/a0.png")

	cnum_x = 0
	cnum_y = 3
end

function love.draw()
	-- Gray color for background.
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8)

	-- Create fields border.
	love.graphics.setColor(0, 0, 0)
	love.graphics.setLineWidth(2)

	love.graphics.rectangle(
		"line", field_coordinates.x, field_coordinates.y, 
		field_size.x, field_size.y
	)

	love.graphics.rectangle(
		"line", next_field_coordinates.x, next_field_coordinates.y, 
		size_next, size_next
	)

	-- Fill fields.
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle(
		"fill", field_coordinates.x, field_coordinates.y, 
		field_size.x, field_size.y
	)

	love.graphics.rectangle(
		"fill", next_field_coordinates.x, next_field_coordinates.y, 
		size_next, size_next
	)

	x = field_coordinates.x + cells[cnum_x][cnum_y].x
	y = field_coordinates.y + cells[cnum_x][cnum_y].y
	love.graphics.draw(a0, x, y)
end

function love.keypressed(key, unicode)
	if key == LEFT then
		if cnum_x - 1 >= 0 then
			cnum_x = cnum_x - 1
		end
	end

	if key == RIGHT then
		if cnum_x + 1 < 14 then
			cnum_x = cnum_x + 1
		end
	end
end

function love.update(dt)
	FALL_TIME_NOW = FALL_TIME_NOW - 1

	if FALL_TIME_NOW <= 0 then
		cnum_y = cnum_y + 1
		FALL_TIME_NOW = FALL_TIME
	end
end