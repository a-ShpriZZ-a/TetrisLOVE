local size_cell = 16 -- Размер клетки поля.

local fall_time = 20 -- Число кадров до смещения фигуры на клетку вниз.
local fall_time_now = fall_time

-- ***ПАРАМЕТРЫ ИГРОВОГО ПОЛЯ*** --
local size_x = 14 * size_cell; -- Ширина поля.
local size_y = 28 * size_cell; -- Высота поля.

local field_start_x = 20 -- Координата начала игрового поля по X.
local field_start_y = 20 -- Координата начала игрового поля по Y.


-- ***ПАРАМЕТРЫ ПОЛЯ СЛЕДУЮЩЕЙ ФИГУРЫ*** --
local size_next = 6 * size_cell; -- размер поля следующей фигуры.

local next_start_x = field_start_x + size_x + 20 -- Координата начала поля следующей фигуры по X.
local next_start_y = field_start_y -- Координата начала поля следующей фигуры по Y.

tick = require("tick")
require("Cell") -- Подключаем класс клеток.


-- ***ЦВЕТА ОТРИСОВКИ ЭЛЕМЕНТОВ*** --
local black = { 0, 0, 0 } -- Белый цвет.
local white = { 1, 1, 1 } -- Чёрный цвет.

function love.load()
	tick.framerate = 60

	-- Создание двумерного массива клеток.
	-- И заполнение его экземплярами.
	cells = {}
	for  x = 0, 13 do
		y_cells = {}
		for y = 0, 27 do
			y_cells[y] = Cell:new(size_cell, x, y)
		end
		cells[x] = y_cells
	end

	a0 = love.graphics.newImage("Resources/Sprites/Blocks/a0.png")

	cnum_x = 0
	cnum_y = 3
end

function love.draw()
	-- Зальём фон серым цветом.
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8)

	-- Отрисуем рамки полей чёрным цветом.
	love.graphics.setColor(black)
	love.graphics.setLineWidth(2)
	love.graphics.rectangle("line", field_start_x, field_start_y, size_x, size_y)
	love.graphics.rectangle("line", next_start_x, next_start_y, size_next, size_next)

	-- Зальём поля белым цветом.
	love.graphics.setColor(white)
	love.graphics.rectangle("fill", field_start_x, field_start_y, size_x, size_y)
	love.graphics.rectangle("fill", next_start_x, next_start_y, size_next, size_next)

	x = field_start_x + cells[cnum_x][cnum_y].x
	y = field_start_y + cells[cnum_x][cnum_y].y
	love.graphics.draw(a0, x, y)
end

function love.keypressed(key, unicode)
	if key == "a" then
		if cnum_x - 1 >= 0 then
			cnum_x = cnum_x - 1
		end
	end

	if key == "d" then
		if cnum_x + 1 < 14 then
			cnum_x = cnum_x + 1
		end
	end
end

function love.update(dt)
	fall_time_now = fall_time_now - 1

	if fall_time_now <= 0 then
		cnum_y = cnum_y + 1
		fall_time_now = fall_time
	end
end